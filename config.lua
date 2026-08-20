Config = {}


Config.ScriptName    = 'S82Vehcontrol'   -- Mã định danh nội bộ của script
Config.CommandName   = 'vehcontrol'      -- Lệnh chat để mở HUD  (/vehcontrol)
Config.Locale        = 'vi'              -- Ngôn ngữ (dành cho locale file trong tương lai)
Config.Debug         = false             -- In log debug ra console


--  'qb' | 'esx'
Config.Framework = 'qb'

--  Ai được phép mở HUD?
--  'none'  -> tất cả mọi người
--  'ace'   -> quyền ACE  (S82Vehcontrol.use)
--  'group' -> kiểm tra nhóm/rank người chơi (QBCore / ESX)
--  'job'   -> whitelist theo nghề
Config.PermissionType = 'none'

-- Mã quyền ACE (dùng khi PermissionType = 'ace')
Config.AceNode = 'S82Vehcontrol.use'


Config.AllowedGroups = { 'admin', 'mod', 'vip' }

Config.AllowedJobs = {
    ['police']   = 0,   -- từ rank 0 trở lên được dùng
    ['mechanic'] = 0,
}

Config.Features = {
    MediaPlayer  = true,   -- Trình phát nhạc / stream trong xe
    Windows      = true,   -- Điều khiển kính xe (Trước-Trái / Trước-Phải / Sau-Trái / Sau-Phải)
    Seats        = true,   -- Đổi ghế ngồi trong xe
    Doors        = true,   -- Điều khiển cửa xe (Trước-Trái / Trước-Phải / Cả hai / Cốp)
    Auxiliary    = true,   -- Động cơ, xi nhan, đèn cảnh báo, đèn pha
}

--  PHÍM TẮT
--  Danh sách mã phím FiveM: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/

Config.Keybinds = {
    OpenHUD          = { key = 'F5',     label = 'Mở HUD Điều Khiển Xe',        enabled = false },
    Engine           = { key = 'F8',     label = 'Bật/Tắt Động Cơ',             enabled = false },
    Hazards          = { key = 'F7',     label = 'Bật/Tắt Đèn Cảnh Báo',        enabled = false },
    Lights           = { key = 'F6',     label = 'Bật/Tắt Đèn Pha',             enabled = false },
    IndicatorLeft    = { key = 'Z',      label = 'Xi Nhan Trái',                enabled = false },
    IndicatorRight   = { key = 'X',      label = 'Xi Nhan Phải',                enabled = false },
    WindowFL         = { key = 'NUMPAD1',label = 'Kính Trước-Trái',             enabled = false },
    WindowFR         = { key = 'NUMPAD2',label = 'Kính Trước-Phải',             enabled = false },
    WindowRL         = { key = 'NUMPAD3',label = 'Kính Sau-Trái',               enabled = false },
    WindowRR         = { key = 'NUMPAD4',label = 'Kính Sau-Phải',               enabled = false },
    DoorFL           = { key = 'NUMPAD5',label = 'Cửa Trước-Trái',              enabled = false },
    DoorFR           = { key = 'NUMPAD6',label = 'Cửa Trước-Phải',              enabled = false },
}


Config.Commands = {
    -- /vehcontrol  -> mở HUD NUI
    Open  = Config.CommandName,
}



Config.Engine = {
    -- Giữ nguyên trạng thái động cơ khi người chơi rời khỏi xe
    PersistOnExit  = false,
    -- Tự động tắt động cơ khi người chơi rời khỏi xe
    AutoOff        = true,
}


Config.Indicators = {
    -- Chu kỳ nhấp nháy của xi nhan (mili giây)
    BlinkInterval  = 600,
    -- Tự động hủy xi nhan trái/phải khi xe rẽ (theo độ)
    AutoCancel     = true,
    AutoCancelAngle = 30,
}

Config.MediaPlayer = {
    -- Chỉ cho phép dùng trình phát nhạc khi ở trong xe
    InVehicleOnly   = true,
    -- Âm lượng mặc định (0-100)
    DefaultVolume   = 70,
    -- Cho phép thêm URL stream tùy chỉnh
    AllowCustomURLs = true,
    -- Số bài hát tối đa trong playlist
    MaxPlaylistSize = 50,
    -- Danh sách kênh radio có sẵn (tên, nghệ sĩ, URL)
    DefaultStations = {
        { name = 'Sakura Drive',       artist = 'Synthwave Radio', url = '' },
        { name = 'Peach Blossom Vibe', artist = 'Lo-Fi City',      url = '' },
        { name = 'Neon Street',        artist = 'Urban Beats',     url = '' },
    },
}


-- Bảng màu giao diện mặc định (Sakura / Hoa Anh Đào) - sẽ được CSS áp dụng
Config.Theme = {
    Accent          = '#ff8fb1',
    AccentDark      = '#d9698f',
    Background      = '#1a1319',
    Panel           = '#201620',
    Text            = '#ffe3ec',
    TextMuted       = '#e2a6bc',
    TextDim         = '#8a5f6d',
    Border          = '#2c1e26',
    DotOff          = '#6b2a3a',
    DotOn           = '#ff8fb1',
    ButtonBg        = '#241a22',
    ButtonActive    = '#3a1f2c',
    BarOff          = '#3a2530',
    BarOn           = '#ff8fb1',
}

--  'native' = thông báo gốc của FiveM
--  'ox'     = ox_lib (nếu đã cài)
--  'qb'     = thông báo của QBCore
--  'esx'    = thông báo của ESX
--  'custom' = chỉ dùng toast trên NUI
Config.NotifyStyle = 'native'
