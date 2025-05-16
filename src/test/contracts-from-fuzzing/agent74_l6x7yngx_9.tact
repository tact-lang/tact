struct Nested {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    s: String;
}

struct Outer {
    n1: Nested;
    n2: Nested;
}

contract TestContract {
    record: Outer;

    init() {
        self.record = Outer{
            n1: Nested{ a:1, b:null, c:true, d:null, s:"a" },
            n2: Nested{ a:2, b:null, c:false, d:null, s:"b" }
        };
    }
}