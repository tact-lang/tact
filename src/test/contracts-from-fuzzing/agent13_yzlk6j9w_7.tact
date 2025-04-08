contract OverlappingIntWidths {
    
    small: Int as uint8;
    mid: Int as int32;
    big: Int;
    small2: Int as uint4;
    
    init() {
        self.small = 1;
        self.mid = -12345;
        self.big = 9999999;
        self.small2 = 2;
    }
}