struct InnerBool {
    b: Bool;
}

struct Container {
    f: InnerBool;
}

contract BoolInsideStruct {
    c: Container;

    init() {
        self.c = Container{ f: InnerBool{ b: true } };
    }
}