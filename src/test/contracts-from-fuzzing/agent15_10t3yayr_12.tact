struct LargeNest3 {
    val1: Int;
    val2: String;
    val3: Bool;
}

struct LargeNest2 {
    nest: LargeNest3;
    s: String;
}

struct LargeNest1 {
    nest2: LargeNest2;
    b: Bool;
}

contract BigDeep {
    val: LargeNest1;

    init() {
        self.val = LargeNest1{
            nest2: LargeNest2{
                nest: LargeNest3{
                    val1: 42,
                    val2: "test",
                    val3: true,
                },
                s: "hello",
            },
            b: false,
        };
    }
}