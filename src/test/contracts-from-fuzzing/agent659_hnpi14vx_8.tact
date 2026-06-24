struct MixDefaults {
    a: Int;
    b: Bool = false;
    c: String?;
    d: Int = 7;
    e: Bool?;
    f: String = "hello";
    g: Address?;
}

contract TestContract {
    data: MixDefaults;

    init() {
        self.data = MixDefaults{
            a: 123,
            c: "abc",
            e: null,
            g: null,
        };
    }
}