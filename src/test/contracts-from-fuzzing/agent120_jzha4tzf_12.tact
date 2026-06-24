contract ConstMix {
    const MAGIC: Int = 31337;
    const NAME: String = "foo";
    const FLAG: Bool = true;
    
    x: Int = 7;
    y: Bool = false;
    z: String = "bar";

    init() {
        self.x = self.MAGIC;
        self.y = self.FLAG;
        self.z = self.NAME;
    }
}