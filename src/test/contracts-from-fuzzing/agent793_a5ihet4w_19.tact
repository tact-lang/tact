struct OptIntBool {
    x: Int?;
    y: Bool?;
}

contract NestedOptionalsTest {
    opt: OptIntBool;

    init() {
        self.opt = OptIntBool{
            x: null,
            y: true
        };
    }

    receive() {}
}