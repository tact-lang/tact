struct Inner {
    value: Int;
}

struct Outer {
    nested: Inner?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{
                value: 123
            }
        };
    }
}