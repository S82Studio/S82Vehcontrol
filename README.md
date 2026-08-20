# S82Vehcontrol

**S82 Studio · VehControl**
HUD điều khiển xe toàn diện cho FiveM — nhạc, kính, cửa, ghế và các tính năng phụ trợ.

---

## 📦 Cài đặt

1. Copy toàn bộ thư mục `S82Vehcontrol` vào thư mục `resources` của server.
2. Thêm vào `server.cfg`:
   ```
   ensure S82Vehcontrol
   ```
3. Mở file `config.lua` để chỉnh sửa theo nhu cầu server (xem phần **Cấu hình** bên dưới).
4. Khởi động lại server hoặc dùng `refresh` + `ensure S82Vehcontrol`.

Không yêu cầu cài đặt thêm resource nào khác để chạy cơ bản (script tự vẽ HUD bằng NUI, dùng native FiveM). Nếu muốn dùng thông báo qua QBCore/ESX/ox_lib, xem mục `Config.NotifyStyle`.

---

## ✨ Tính năng chính

### 🎵 Trình phát nhạc trong xe
- Phát nhạc từ **link YouTube** hoặc **URL stream trực tiếp** (mp3, radio online...).
- Thêm / xóa / đổi tên bài hát ngay trong playlist.
- Điều khiển đầy đủ: Phát/Tạm dừng, Bài trước/sau, Tắt tiếng, Trộn bài (Shuffle), Lặp lại (Repeat).
- Thanh tiến trình bài hát có thể tua bằng cách click chuột.
- Chỉ hoạt động khi ở trong xe (có thể tắt trong config) — tự động tạm dừng khi rời xe.
- Playlist được lưu cục bộ trên máy người chơi (localStorage) nên không bị mất khi mở lại HUD.

### 🪟 Điều khiển kính xe
- 4 nút riêng biệt: Trước-Trái, Trước-Phải, Sau-Trái, Sau-Phải.
- Đồng bộ trạng thái lên/xuống theo thời gian thực trên giao diện.

### 🚪 Điều khiển cửa xe
- 6 nút: Trước-Trái, Trước-Phải, Sau-Trái, Sau-Phải, Cốp, Capo.
- Mở/đóng từng cửa độc lập, hiển thị trạng thái ON/OFF trực quan.

### 💺 Đổi ghế ngồi
- Tự động phát hiện số ghế tối đa của xe hiện tại (tối đa hiển thị 6 ghế).
- Bấm để chuyển ngay sang ghế đã chọn; nếu ghế đang có người, hệ thống sẽ tự đuổi họ ra trước khi đổi chỗ.
- Hiển thị cảnh báo nếu người chơi không ở trong xe.

### ⚡ Điều khiển phụ trợ
- **Động cơ**: Bật/tắt máy xe trực tiếp từ HUD, tự động tắt máy khi rời xe (có thể tùy chỉnh).
- **Xi nhan trái/phải**: Nhấp nháy tự động theo chu kỳ cấu hình được, tự hủy khi bật xi nhan bên còn lại.
- **Đèn cảnh báo (hazard)**: Bật cả hai bên cùng lúc, tự hủy xi nhan khi kích hoạt.
- **Đèn pha**: Bật/tắt đèn trước xe.

### 🔐 Hệ thống phân quyền
Cấu hình linh hoạt trong `config.lua` (`Config.PermissionType`):
- `none` — Ai cũng dùng được.
- `ace` — Yêu cầu quyền ACE (`S82Vehcontrol.use`).
- `group` — Kiểm tra nhóm/rank người chơi (hỗ trợ QBCore và ESX).
- `job` — Whitelist theo nghề + cấp bậc tối thiểu (`Config.AllowedJobs`).

### ⌨️ Phím tắt tùy chỉnh
Có thể bật/gán phím riêng cho: mở HUD, bật/tắt máy, đèn cảnh báo, đèn pha, xi nhan trái/phải, từng kính và 2 cửa trước — tất cả nằm trong `Config.Keybinds`, mặc định đang tắt (`enabled = false`) để tránh xung đột phím với script khác, bật lên khi cần.

---

## ⚙️ Cấu hình nhanh (`config.lua`)

| Thiết lập | Mô tả |
|---|---|
| `Config.CommandName` | Lệnh chat mở HUD (mặc định `/vehcontrol`) |
| `Config.Framework` | `'qb'` hoặc `'esx'` — dùng khi `PermissionType = 'group'/'job'` |
| `Config.PermissionType` | Kiểu phân quyền mở HUD |
| `Config.Features` | Bật/tắt từng module: nhạc, kính, ghế, cửa, phụ trợ |
| `Config.Keybinds` | Gán phím tắt cho từng chức năng |
| `Config.Engine.AutoOff` | Tự tắt máy khi rời xe |
| `Config.Indicators.BlinkInterval` | Tốc độ nhấp nháy xi nhan (ms) |
| `Config.MediaPlayer` | Âm lượng mặc định, cho phép thêm URL tùy chỉnh, danh sách kênh mặc định |
| `Config.Theme` | Bảng màu giao diện HUD |
| `Config.NotifyStyle` | Kiểu thông báo: `native` / `ox` / `qb` / `esx` / `custom` |

---

## 🗺️ Cấu trúc thư mục

```
S82Vehcontrol/
├── fxmanifest.lua
├── config.lua
├── client/
│   ├── main.lua        -- Mở/đóng HUD, xử lý callback NUI, phím tắt
│   ├── controls.lua     -- Logic điều khiển xe (máy, kính, cửa, ghế, đèn, xi nhan)
│   └── music.lua         -- Callback NUI cho trình phát nhạc
├── server/
│   └── main.lua          -- Kiểm tra quyền theo nhóm/nghề (group/job)
└── html/
    ├── index.html
    ├── css/
    │   ├── style.css              -- Giao diện Sakura
    │   └── fontawesome.min.css    -- Icon (nhúng cục bộ)
    ├── js/
    │   ├── app.js                 -- Logic HUD chính, đồng bộ trạng thái
    │   └── music.js                -- Logic trình phát nhạc (YouTube + audio stream)
    ├── fonts/       -- Roboto (nhúng cục bộ)
    └── webfonts/    -- Font Awesome (nhúng cục bộ)
```

---

## 📝 Ghi chú

- Đây là script độc lập (standalone), không bắt buộc phải có QBCore/ESX/ox_lib để hoạt động ở chế độ `PermissionType = 'none'`.
- Nếu dùng `PermissionType = 'group'` hoặc `'job'`, đảm bảo `Config.Framework` khớp với framework server đang chạy (`qb` hoặc `esx`).
- Trình phát nhạc dùng YouTube IFrame API (`youtube.com/iframe_api`) cho tính năng phát nhạc từ link YouTube — đây là yêu cầu bắt buộc của tính năng này, cần server/client có kết nối Internet bình thường.

---

*S82 Studio*
