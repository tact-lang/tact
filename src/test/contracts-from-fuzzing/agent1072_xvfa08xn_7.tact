struct BigNested {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: Bool?;
    f: String?;
}

struct Wrapper {
    val1: BigNested;
    val2: BigNested;
}

contract ComplexNested {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            val1: BigNested{ a:1, b:"x", c:true, d:null, e:null, f:null },
            val2: BigNested{ a:2, b:"y", c:false, d:3, e:true, f:"z" }
        };
    }
}