struct OptInner {
    innerVal: Int?;
}

struct Container {
    optField: OptInner?;
    flag: Bool;
}

contract TestContract {
    s: Container;

    init() {
        self.s = Container{
            optField: null,
            flag: true
        };
    }
}