struct Nested1 {
    x: Int;
    y: Int;
    z: Int;
}

struct Nested2 {
    a: Nested1;
    b: Nested1;
}

struct Nested3 {
    first: Nested2;
    second: Nested2;
    flag: Bool;
    text: String;
    opt: Int?;
}

contract Deep {
    data: Nested3;

    init() {
        self.data = Nested3{
            first: Nested2{
                a: Nested1{ x:1, y:2, z:3 },
                b: Nested1{ x:4, y:5, z:6 }
            },
            second: Nested2{
                a: Nested1{ x:7, y:8, z:9 },
                b: Nested1{ x:10, y:11, z:12 }
            },
            flag: true,
            text: "abc",
            opt: null
        };
    }
}
