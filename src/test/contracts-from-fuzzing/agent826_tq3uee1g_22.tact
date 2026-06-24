struct Alternating {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: Bool;
    f: String?;
}

contract AlternatingFields {
    complex: Alternating;
    init() {
        self.complex = Alternating{
            a:1, b:null, c:"abc", d:null, e:true, f:null
        };
    }
}