// optional struct with default values on inner
struct Inner {
    x: Int = 42;
    y: Bool = true;
}

struct Outer {
    inn: Inner?;
}

contract NestedDefaultOpt {
    val: Outer;

    init() {
        self.val = Outer{
            inn: Inner{}
        };
    }
}