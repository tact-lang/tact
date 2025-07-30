contract TestContract {
    x: Int = 123;
    y: Bool = true;
    z: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    s: String = "init";
    
    init() {
        self.x = 42;
        self.y = false;
        self.z = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.s = "done";
    }
}