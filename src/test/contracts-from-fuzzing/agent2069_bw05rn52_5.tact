struct HugeNested {
    a: Int;
    b: Nested1;
    c: Nested2;
    d: Int;
}

struct Nested1 {
    x: Int;
    y: Bool;
}

struct Nested2 {
    z: Int;
    inner: Nested3;
}

struct Nested3 {
    f: Bool;
    deep: Nested4?;
}

struct Nested4 {
    veryDeep: Int;
}

contract TestHugeNested {
    data: HugeNested;

    init() {
        self.data = HugeNested{
            a: 1,
            b: Nested1{x: 2, y: false},
            c: Nested2{z: 3, inner: Nested3{f: true, deep: null}},
            d: 4
        };
    }
}