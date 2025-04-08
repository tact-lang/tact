struct LargeNested {
    sub1: Nested;
    sub2: Nested;
    sub3: Nested;
}

struct Nested {
    a: Int;
    b: Int?;
    c: Bool;
}

contract BigNest {
    field: LargeNested = LargeNested{
        sub1: Nested{a:1, b:null, c:true},
        sub2: Nested{a:2, b:null, c:false},
        sub3: Nested{a:3, b:null, c:true}
    };

    init() {}
}