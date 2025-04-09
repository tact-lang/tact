struct NestedBool {
    x: Bool;
}

struct Container {
    y: NestedBool;
    z: NestedBool?;
}

contract TestContract {
    c: Container;

    init() {
        self.c = Container{
            y: NestedBool{ x:true },
            z: null
        };
    }
}