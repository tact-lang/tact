struct Nested {
    x: Int;
    y: Bool;
    z: String;
}

struct Outer {
    one: Nested;
    two: Nested;
    three: Nested;
}

contract Tester {
    param: Outer;

    init() {
        self.param = Outer{
            one: Nested{ x:1, y:true, z:"a" },
            two: Nested{ x:2, y:false, z:"b" },
            three: Nested{ x:3, y:true, z:"c" },
        };
    }
}
