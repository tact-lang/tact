struct Inner {
    val: Int;
}

struct Middle {
    innerOpt: Inner?;
}

struct OuterOpt {
    middleOpt: Middle?;
    flag: Bool;
}

contract Test {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            middleOpt: null,
            flag: true
        };
    }
}