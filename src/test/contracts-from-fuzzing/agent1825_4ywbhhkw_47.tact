contract SerializationTest {
    x: Int as uint16;
    y: Int as int64;
    b: Bool;
    s: String;
    
    init() {
        self.x=65535;
        self.y=-4096;
        self.b=true;
        self.s="hello";
    }
}
