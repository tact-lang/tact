struct Inner {
    val: Int?;
    flag: Bool?;
}

struct Container {
    innerOpt: Inner?;
}

contract Test {
    data: Container;

    init() {
        self.data = Container{
            innerOpt: null
        };
    }
}
