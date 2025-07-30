struct LargeDeeplyNested {
    a: Int;
    b: Nested1;
    c: Nested2;
    d: Nested3;
    e: Nested4;
}

struct Nested1 {
    one: Bool;
    two: Int?;
}

struct Nested2 {
    x: Int;
    y: Bool?;
}

struct Nested3 {
    foo: Int;
    bar: Int;
}

struct Nested4 {
    flag: Bool;
    nestedInner: NestedInner;
}

struct NestedInner {
    val: Int?;
}

contract LargeDeeplyNestedTest {
    big: LargeDeeplyNested;
    
    init() {
        self.big = LargeDeeplyNested{
            a: 1,
            b: Nested1{one: true, two: null},
            c: Nested2{x: 2, y: false},
            d: Nested3{foo: 3, bar: 4},
            e: Nested4{flag: true, nestedInner: NestedInner{val: 5}}
        };
    }
}