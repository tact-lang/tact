struct NestedOpt {
    sub: OptionalStruct?;
    flag: Bool;
}

contract OptInStructTest {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{
            sub: null,
            flag: true
        };
    }
}

struct OptionalStruct {
    s: String?;
    n: Int?;
    b: Bool?;
}
