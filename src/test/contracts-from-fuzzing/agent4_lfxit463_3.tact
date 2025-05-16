struct OptNest {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Wrap {
    inner: OptNest;
    val: Int;
    flag: Bool;
}

contract OptTest {
    field: Wrap;

    init() {
        self.field = Wrap{
            inner: OptNest{
                a: null,
                b: true,
                c: null,
            },
            val: 99,
            flag: false,
        };
    }
}