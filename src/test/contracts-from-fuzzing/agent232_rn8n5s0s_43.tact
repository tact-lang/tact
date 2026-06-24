struct DeepOpt {
    inner: DeeperOpt?;
    flag: Bool;
}

struct DeeperOpt {
    nested: Int?;
    check: Bool?;
}

contract DeepOptTest {
    val: DeepOpt;

    init() {
        self.val = DeepOpt{
            inner:null, flag:true
        };
    }
}