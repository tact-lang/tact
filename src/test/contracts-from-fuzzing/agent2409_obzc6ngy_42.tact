struct InnerDeepOptional {
    opt: InnerMost?;
}

struct InnerMost {
    val: Int;
}

struct Container {
    dep: InnerDeepOptional;
}

contract NullDeepOptional {
    data: Container;

    init() {
        self.data = Container{
            dep: InnerDeepOptional{
                opt: null
            }
        };
    }
}