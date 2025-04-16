struct Inner {
    x: Int;
    y: Int?;
}

struct Outer {
    nested: Inner;
    flag: Bool = true;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{
            nested: Inner{ x: 1, y: null },
            flag: false
        };
    }
}