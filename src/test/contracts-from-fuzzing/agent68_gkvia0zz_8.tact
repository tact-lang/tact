struct OptStr {
    text: String?;
}

struct TopOpt {
    inner: OptStr?;
}

contract StrOptTest {
    top: TopOpt?;

    init() {
        self.top = null;
    }
}