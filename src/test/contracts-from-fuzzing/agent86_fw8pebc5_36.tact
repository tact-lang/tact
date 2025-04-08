// persistent storage default init then partial assign in init
contract DefaultThenInit {
    a: Int = 0;
    b: Int;

    init() {
        self.b = 5;
    }
}