struct VeryDeep {
    i1: Int;
    i2: Int;
    s1: String;
    s2: String;
    b1: Bool;
    b2: Bool;
    opt1: Int?;
    opt2: String?;
    flag: Bool?;
}

contract TestContract {
    data: VeryDeep;

    init() {
        self.data = VeryDeep{
            i1: 1,
            i2: 2,
            s1: "hi",
            s2: "there",
            b1: true,
            b2: false,
            opt1: null,
            opt2: "present",
            flag: null
        };
    }

    receive() {}
}