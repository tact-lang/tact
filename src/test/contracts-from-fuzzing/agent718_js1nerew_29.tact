struct AltOpt {
    f1: Int;
    o1: Int?;
    f2: Bool;
    o2: Bool?;
    f3: String;
    o3: String?;
}

contract TestContract {
    data: AltOpt;

    init() {
        self.data = AltOpt{
            f1: 1,
            o1: null,
            f2: false,
            o2: true,
            f3: "abc",
            o3: null
        };
    }
}