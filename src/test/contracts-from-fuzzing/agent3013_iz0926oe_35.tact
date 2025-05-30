struct Basic {
    a: Int;
}

struct WrapOpt {
    inner: Basic?;
}

contract WrapperOptTest {
    val: WrapOpt;

    init() {
        self.val = WrapOpt{inner: null};
    }
}
