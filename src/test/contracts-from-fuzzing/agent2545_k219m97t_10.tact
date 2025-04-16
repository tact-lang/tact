contract DefaultsAndExplicitInit {
    i1: Int = 10;
    b1: Bool = true;
    s1: String = "abc";
    addr: Address;

    init() {
        self.addr = myAddress();
    }
}
