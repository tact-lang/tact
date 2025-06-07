struct SmallNest {
    flag: Bool;
    note: String;
}

struct Outer {
    info: SmallNest;
    num: Int;
}

contract DeepTest {
    outer: Outer;

    init() {
        self.outer = Outer{
            info: SmallNest{
                flag: false,
                note: "test",
            },
            num: 123,
        };
    }
}