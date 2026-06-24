struct Base {
    a: Int;
}

struct Container {
    inner1: Base;
    inner2: Base?;
}

contract StructOptions {
    val: Container;

    init() {
        self.val = Container{
            inner1: Base{a:1},
            inner2: null
        };
    }
}