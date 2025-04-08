contract DeepMixOption {
    x: Int?;
    y: Bool = false;
    z: String?;
    addr: Address;
    c: Cell?;

    init() {
        self.x = null;
        self.z = null;
        self.addr = myAddress();
        self.c = null;
    }
}