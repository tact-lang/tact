struct DeepOpt {
    nested: DeepLevel?;
}

struct DeepLevel {
    msg: String;
    cnt: Int;
    innerOpt: String?;
}

contract DeepOptTest {
    payload: DeepOpt;

    init() {
        self.payload = DeepOpt{
            nested: DeepLevel{
                msg: "hi",
                cnt: 5,
                innerOpt: null,
            }
        };
    }
}