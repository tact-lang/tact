struct ZeroDefaults {
    a: Int;
    b: Bool;
    c: String;
}

contract DefaultsTest {
    data: ZeroDefaults;

    init() {
        self.data = ZeroDefaults{
            a: 0,
            b: false,
            c: "",
        };
    }
}