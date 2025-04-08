struct InnerForOpt {
    str: String;
    num: Int;
}

struct OuterWithOpt {
    field: InnerForOpt?;
    count: Int;
}

contract OptionalInnerStructTest {
    val: OuterWithOpt;

    init() {
        self.val = OuterWithOpt{
            field: null,
            count: 10,
        };
    }
}