struct BigNested {
    one: Int;
    two: Bool;
    sub: NestedSub;
}

struct NestedSub {
    opt1: Bool?;
    opt2: Int?;
    val: Int;
}

contract TestContract {
    data: BigNested;

    init() {
        self.data = BigNested{
            one: 10,
            two: false,
            sub: NestedSub{ opt1: null, opt2: 22, val: 99 }
        };
    }
}