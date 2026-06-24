struct ManyNestedDefaults {
    inner1: Nested;
    inner2: Nested;
}

struct Nested {
    x: Int = 42;
    y: Bool = true;
}

contract NestedDefs {
    data: ManyNestedDefaults;

    init() {
        self.data = ManyNestedDefaults{
            inner1: Nested{x:1,y:false},
            inner2: Nested{}
        };
    }
}