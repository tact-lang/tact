contract TestContract {
    x: Int = 1;
    y: Bool = true;
    z: String = "hello";
    addr: Address;

    init() {
        self.addr = myAddress();
    }
}