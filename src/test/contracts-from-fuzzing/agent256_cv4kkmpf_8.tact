struct Inner {
    a: Int;
    b: Bool;
}

struct Container {
    f1: Int;
    f2: Bool;
    s1: Inner;
    f3: Int;
    s2: Inner;
    f4: Bool;
}

contract MixedStructs {
    storage: Container;

    init() {
        self.storage = Container{
            f1:1, f2:true,
            s1: Inner{a:10, b:false},
            f3:3,
            s2: Inner{a:20, b:true},
            f4:false
        };
    }
}