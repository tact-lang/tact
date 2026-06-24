struct ParamSet {
    a: Int = 1;
    b: Int?;
    s: String = "abc";
    flag: Bool?;
}

contract Test {
    params: ParamSet = ParamSet{};

    init() {
        self.params = ParamSet{
            a: 12,
            b: 45,
            s: "xyz",
            flag: true,
        };
    }
}