struct DefaultsVsInit {
    foo: Int = 1;
    bar: Int = 2;
}

contract DefaultsVsInitContract {
    data: DefaultsVsInit;

    init() {
        self.data = DefaultsVsInit{ foo: 42, bar: 99 };
    }
}