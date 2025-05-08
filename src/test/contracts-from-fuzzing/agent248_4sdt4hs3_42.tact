struct DefaultsVsInit {
    x: Int = 7;
    y: Int;
}

contract TestContract {
    d: DefaultsVsInit;

    init() {
        self.d = DefaultsVsInit{ x: 100, y: 200 };
    }
}