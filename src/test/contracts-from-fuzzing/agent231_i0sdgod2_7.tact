struct Inner {
    a: Int;
    b: Bool?;
    c: String;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
    intVal: Int;
    strVal: String?;
}

contract NestOpts {
    data: Outer;

    init() {
        self.data = Outer{
            inner1: Inner{ a:1, b:true, c:"x" },
            inner2: Inner{ a:2, b:null, c:"y" },
            intVal: 42,
            strVal: null,
        };
    }
}