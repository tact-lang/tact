struct InnerOpt {
    str: String?;
    num: Int?;
}

struct OuterOpt {
    innerOpt: InnerOpt?;
    flag: Bool;
}

contract DoubleOptionalTest {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            innerOpt: InnerOpt{str:null, num:9},
            flag: true
        };
    }
}