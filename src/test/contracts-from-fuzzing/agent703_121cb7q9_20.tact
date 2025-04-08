contract TestContract {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Bool = false;
    e: Bool = true;
    f: String = "hi";
    g: String = "world";
    addr: Address; 

    init() {
        self.addr = myAddress();
    }
}