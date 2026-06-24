struct Inner {
    v1: Int;
    v2: String;
    v3: Bool;
}

struct Container {
    inn: Inner;
    opt: Inner?;
}

contract NullableStructs {
    f: Container;

    init() {
        self.f = Container{
            inn: Inner { v1:1, v2:"x", v3:true },
            opt: null
        };
    }
}