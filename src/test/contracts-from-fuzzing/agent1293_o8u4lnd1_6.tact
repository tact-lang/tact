struct DeepOpt {
    middle: MiddleOpt?;
}

struct MiddleOpt {
    inner: InnerOpt?;
}

struct InnerOpt {
    val: Int?;
}

contract NestOptTest {
    data: DeepOpt;

    init() {
        self.data = DeepOpt{
            middle: MiddleOpt{
                inner: InnerOpt{
                    val: 123
                }
            }
        };
    }
}