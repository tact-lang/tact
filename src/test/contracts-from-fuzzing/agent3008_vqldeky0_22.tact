struct Param {
    a: Int;
    b: Bool;
}

struct Container {
    p1: Param;
    p2: Param?;
    flag: Bool;
}

contract NestedParams {
    holder: Container;

    init() {
        self.holder = Container{
            p1: Param{a:10,b:true},
            p2: null,
            flag: false,
        };
    }
}