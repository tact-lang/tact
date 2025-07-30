struct Sub {
    val: Int;
}

struct Container {
    nestedOpt: Sub?;
    x: Int;
}

contract OptStructImplicit {
    val: Container;

    init() {
        self.val = Container{
            x: 42
        };
    }

    receive() {}
}