struct MultiType {
    i: Int;
    b: Bool;
    s: String;
    optI: Int?;
    optS: String?;
    optB: Bool?;
}

contract Combo {
    f: MultiType;
    init() {
        self.f = MultiType{
            i: 2,
            b: false,
            s: "test",
            optI: null,
            optS: null,
            optB: null
        };
    }
}