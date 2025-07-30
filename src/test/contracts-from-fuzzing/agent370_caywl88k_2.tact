struct Nested {
    x: Int;
    y: Bool?;  
    z: String;
}

struct Outer {
    ns: Nested;
    flag: Bool;
}

contract DeepTest {
    st: Outer;

    init() {
        self.st = Outer{
            ns: Nested{ x: 5, y: null, z: "ok" },
            flag: true
        };
    }
}