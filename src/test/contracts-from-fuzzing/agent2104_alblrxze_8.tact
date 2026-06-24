struct Param {
    x: Int;
    y: Bool?;
}

struct Container {
    a: Param;
    b: Param;
}

contract DoubleNested {
    data: Container;

    init() {
        self.data = Container{
            a: Param{x: 1, y: null},
            b: Param{x: 2, y: true}
        };
    }
}