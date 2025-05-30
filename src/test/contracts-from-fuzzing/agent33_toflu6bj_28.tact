struct Inner {
    data: Int;
}

struct Outer {
    innerOpt: Inner?;
    flag: Bool;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{
            innerOpt: Inner{ data: 5 },
            flag: true
        };
    }
}