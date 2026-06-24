struct Reordered {
    s: String;
    b: Bool;
    i: Int;
    optS: String?;
    optB: Bool?;
    optI: Int?;
}

contract Test {
    impl: Reordered;

    init() {
        self.impl = Reordered{
            s: "abc",
            b: false,
            i: 123,
            optS: null,
            optB: true,
            optI: null
        };
    }
}