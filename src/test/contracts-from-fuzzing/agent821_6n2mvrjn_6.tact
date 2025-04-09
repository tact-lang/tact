struct OptNested {
    nestedOpt: Inner?;
}

struct Inner {
    x: Int;
    y: Bool?;
    z: String?;
}

contract TestOptNested {
    var1: OptNested;
    var2: OptNested;

    init() {
        self.var1 = OptNested{nestedOpt: null};
        self.var2 = OptNested{nestedOpt: Inner{x:1, y:null, z:null}};
    }
}