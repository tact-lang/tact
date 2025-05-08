struct BoolNest {
    a: Bool;
    b: Bool;
    c: Bool;
}

struct Container {
    nested: BoolNest;
    flag: Bool;
}

contract TestContract {
    state: Container;

    init() {
        self.state = Container{
            nested: BoolNest{ a:true, b:false, c:true },
            flag: false
        };
    }
}