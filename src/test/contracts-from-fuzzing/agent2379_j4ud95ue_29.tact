struct S {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract Test {
    field: S;

    init() {
        self.field = S{
            a:1, b:true, c:"abc", d:null, e:null, f:null
        };
    }
}