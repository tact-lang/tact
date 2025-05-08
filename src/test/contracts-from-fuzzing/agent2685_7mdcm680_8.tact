struct S {
    a: Int?;
    b: Bool?;
    c: String;
    d: Bool?;
    e: Int?;
    f: String;
}

contract V {
    s: S = S{
        a:null, b:null, c:"a", d:true, e:123, f:"b"
    };
}
