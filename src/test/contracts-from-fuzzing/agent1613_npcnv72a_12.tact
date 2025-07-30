struct First {
    x: Int;
    y: Int;
}

struct Second {
    s: String;
    b: Bool;
}

struct Container {
    f: First;
    s: Second;
    opt1: Int?;
    opt2: String?;
}

contract StructInStruct {
    field: Container;

    init() {
        self.field = Container{
            f: First{x:1,y:2},
            s: Second{s:"s",b:true},
            opt1:null,
            opt2:null
        };
    }
}
