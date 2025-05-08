struct EmptyDefaults {
    a: Int;
    b: Int;
}

contract EmptyDefaultsContract {
    state: EmptyDefaults;

    init() {
        self.state = EmptyDefaults{
            a: 1,
            b: 2
        };
    }
}