struct SOpt {
    txt: String?;
}

struct DeepOpt {
    embed: SOpt?;
}

contract DoubleOptTest {
    val: DeepOpt;
    init() {
        self.val = DeepOpt{ embed: null };
    }
}
