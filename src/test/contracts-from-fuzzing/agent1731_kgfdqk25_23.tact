struct Sub {
    x: Int;
}

struct Container {
    sub1: Sub?;
    sub2: Sub?;
}

contract OptStructs {
    val: Container;

    init() {
        self.val = Container{
            sub1: null,
            sub2: null
        };
    }
}
