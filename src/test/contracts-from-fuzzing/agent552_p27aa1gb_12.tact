struct Inner {
    val: Int?;
}

struct Outer {
    nested: Inner?;
}

contract TestContract {
    state: Outer?;

    init() {
        self.state = Outer{
            nested: null
        };
    }
}