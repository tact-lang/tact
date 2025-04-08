contract ComboDefaults {
    x: Int = 1;
    y: Int = 2;
    z: Int = 3;
    init() {
        self.x=4; self.y=5; self.z=6;
    }
    receive() {
        let _ = self.x + self.y + self.z;
    }
}