struct LargeNested {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Int;
    h: Int;
    nested1: Nested;
    nested2: Nested;
}

struct Nested {
    x: Int;
    y: Int;
    flag: Bool;
}

contract LargeNestedContract {
    store: LargeNested;

    init() {
        self.store = LargeNested{
            a: 1, b: 2, c: 3, d: 4, e: 5, f:6, g:7, h:8,
            nested1: Nested{ x:10, y:20, flag:true },
            nested2: Nested{ x:100, y:200, flag:false }
        };
    }
}