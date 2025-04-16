struct Nested {
    a: Int;
    b: Bool?;
    c: String;
    d: String?;
}

struct Outer {
    inner1: Nested;
    inner2: Nested;
}

contract Fuzz2 {
    value: Outer;

    init() {
        self.value = Outer{
            inner1: Nested{ a:1, b:null, c:"abc", d:null },
            inner2: Nested{ a:2, b:true, c:"def", d:"ghi" },
        };
    }
}