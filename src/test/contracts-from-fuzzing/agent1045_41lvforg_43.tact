struct Inner {
    val: Int;
}

struct Outer {
    field: Inner?;
}

contract Buggy {
    state: Outer;

    init() {
        self.state = Outer{
            field: null
        };
    }
}