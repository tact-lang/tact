struct EmptyDefaults {
    a: Int;
    b: Int;
    c: Int;
}

contract DefaultsInit {
    data: EmptyDefaults;

    init() {
        self.data = EmptyDefaults{
            a: 1,
            b: 2,
            c: 3
        };
    }
}