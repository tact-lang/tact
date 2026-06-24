struct TwoLevelOpt {
    a: Int?;
    b: Bool?;
}

struct OuterOpt {
    inner: TwoLevelOpt?;
    s: String;
}

contract OptionNestTest {
    data: OuterOpt;
    init() {
        self.data = OuterOpt{inner: null, s: "x"};
    }
}