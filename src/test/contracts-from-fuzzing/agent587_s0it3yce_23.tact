contract ZeroDefaults {
    x: Int;
    y: Int;
    z: Int;
    init() {
        self.x=0; self.y=0; self.z=0;
    }
    receive() {
        let _ = self.x + self.y + self.z;
    }
}