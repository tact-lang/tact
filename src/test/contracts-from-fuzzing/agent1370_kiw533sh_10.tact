struct InnerA {
    flag: Bool;
    value: Int;
}

struct InnerB {
    message: String;
    num: Int;
}

struct OuterUnionLike {
    kind: Int as uint8;
    a: InnerA?;
    b: InnerB?;
}

contract UnionLikeTest {
    data: OuterUnionLike;

    init() {
        self.data = OuterUnionLike{
            kind: 0,
            a: InnerA{flag: true, value: 123},
            b: null
        };
    }
}