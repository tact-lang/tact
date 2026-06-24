struct DefaultVsInit {
    a: Int = 10;
    b: Int;
}

contract TestContract {
    s: DefaultVsInit;

    init() {
        self.s = DefaultVsInit{
            b: 20
        };
    }
}
