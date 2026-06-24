struct MidOpt {
    a: Int;
    b: Bool?;
    c: String;
}

contract MiddleOptTest {
    val: MidOpt;

    init() {
        self.val = MidOpt{
            a: 10,
            b: null,
            c: "end",
        };
    }
}
