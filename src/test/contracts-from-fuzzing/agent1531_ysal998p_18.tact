struct Defaults {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
}

struct Container {
    x: Defaults;
    y: Defaults;
}

contract Test {
    val: Container;

    init() {
        self.val = Container{
            x: Defaults{},
            y: Defaults{},
        };
    }
}
