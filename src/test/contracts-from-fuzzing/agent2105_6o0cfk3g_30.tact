struct InnerStruct {
    x: Int;
}

struct Container {
    inner1: InnerStruct;
    inner2: InnerStruct;
    inner3: InnerStruct;
}

contract TestContract {
    s: Container;

    init() {
        self.s = Container{
            inner1: InnerStruct{x: 1},
            inner2: InnerStruct{x: 2},
            inner3: InnerStruct{x: 3},
        };
    }
}