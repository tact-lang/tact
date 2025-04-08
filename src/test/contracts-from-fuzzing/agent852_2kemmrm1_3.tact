contract ExplicitInit {
    x: Int;
    y: Bool;
    s: String;
    addr: Address;

    init() {
        self.x = 99;
        self.y = false;
        self.s = "test";
        self.addr = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    }

    receive() {}
}