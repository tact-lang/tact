struct LargeNested {
    a: Int;
    b: Int;
    c: Int;
    sub: SubNested;
}

struct SubNested {
    x: Int;
    y: Int;
    z: Int;
}

contract LargeNestedContract {
    data: LargeNested;

    init() {
        self.data = LargeNested{
            a:1,
            b:2,
            c:3,
            sub: SubNested{
                x:4,
                y:5,
                z:6
            }
        };
    }
}