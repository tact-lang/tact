struct Nested {
    a: Int;
    b: String;
    c: Bool;
}

contract MultiArrayStyle {
    s1: Nested;
    s2: Nested;
    s3: Nested;
    s4: Nested;
    s5: Nested;
    init() {
        self.s1 = Nested{a:1,b:"a",c:true};
        self.s2 = Nested{a:2,b:"b",c:false};
        self.s3 = Nested{a:3,b:"c",c:true};
        self.s4 = Nested{a:4,b:"d",c:false};
        self.s5 = Nested{a:5,b:"e",c:true};
    }
}