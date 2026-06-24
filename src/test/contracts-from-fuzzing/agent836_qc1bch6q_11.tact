contract IntSerial {
    a: Int as uint3 = 7;
    b: Int as int5;
    c: Int as uint16 = 65535;
    
    init() {
        self.b = -15;
    }
}