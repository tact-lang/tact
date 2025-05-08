contract IntWidths {
    u4field: Int as uint4;
    u8field: Int as uint8;
    s16field: Int as int16;

    init() {
        self.u4field = 5;
        self.u8field = 255;
        self.s16field = -12345;
    }
}