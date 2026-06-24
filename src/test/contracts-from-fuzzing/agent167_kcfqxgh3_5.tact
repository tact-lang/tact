struct OptInner {
    x: Int = 8;
}

struct Container {
    innerOpt: OptInner?;
    flag: Bool = false;
}

contract OptionalInside {
    data: Container;

    init() {
        self.data = Container{
            innerOpt: OptInner{x: 42},
            flag: true
        };
    }
}