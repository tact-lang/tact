struct Embedded {
    a: Int;
    b: Bool;
    c: String;
}

struct TopStruct {
    s1: Embedded;
    s2: Embedded;
    s3: Embedded;
}

contract ManyStructFields {
    t: TopStruct;

    init() {
        self.t = TopStruct{
            s1: Embedded{a:1, b:true, c:"X"},
            s2: Embedded{a:2, b:false, c:"Y"},
            s3: Embedded{a:3, b:true, c:"Z"}
        };
    }
}
