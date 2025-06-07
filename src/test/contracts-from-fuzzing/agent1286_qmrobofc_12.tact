struct BigNested {
    a: Int;
    b: Int;
    c: InnerStruct;
    d: Bool;
    e: Bool?;
}

struct InnerStruct {
    foo: Int?;
    bar: String;
    baz: Bool;
}

contract ComplexNested {
    data: BigNested;

    init() {
        self.data = BigNested{
            a:1, b:2, c:InnerStruct{ foo:null, bar:"hi", baz:true }, d:false, e:null
        };
    }
}