struct SubOpt {
    opt: Int?;
}

struct Container {
    inner: SubOpt?;
}

contract DoubleOptionals {
    c: Container;

    init() {
        self.c = Container{
            inner: SubOpt{ opt: null }
        };
    }
}
