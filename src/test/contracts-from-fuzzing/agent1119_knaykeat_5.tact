struct Inner {
    a: Int;
    b: Bool?;
    c: String;
}

struct Middle {
    x: Inner;
    y: Inner?;
    z: Bool;
}

struct Outer {
    m: Middle;
    n: Middle?;
    p: String?;
}

contract DeepStruct {
    data: Outer;

    init() {
        self.data = Outer{
            m: Middle{ x: Inner{ a:1, b:null, c:"" }, y:null, z:true },
            n: null,
            p: null
        };
    }
}