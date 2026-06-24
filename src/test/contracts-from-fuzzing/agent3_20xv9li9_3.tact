struct InnerOpt {
    a: Int?;
    b: Bool?;
}

struct OuterOpt {
    testInt: Int?;
    testBool: Bool?;
    innerOpt: InnerOpt?;
}

contract OptNestedTest {
    storage: OuterOpt;

    init() {
        self.storage = OuterOpt{
            testInt: null,
            testBool: true,
            innerOpt: InnerOpt{
                a: 123,
                b: null,
            }
        };
    }
}