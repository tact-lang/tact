struct EmptyDefaults {
    a: Int;
    b: Bool;
    c: String;
}

contract DefaultsVsInit {
    ed: EmptyDefaults;

    init() {
        self.ed = EmptyDefaults {
            a: 5,
            b: true,
            c: "x"
        };
    }
}
