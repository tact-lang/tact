contract TestContract {
    x: Int;
    y: Int?;
    z: Int as uint64;
    q: Bool?;
    init() {
        self.x=1; self.y=null; self.z=5; self.q=null;
    }
}