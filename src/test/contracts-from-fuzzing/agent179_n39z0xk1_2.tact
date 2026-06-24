struct Small {
    x: Int;
}

struct Medium {
    a: Int;
    b: Small;
    c: String;
    d: Small;
}

contract DeepNestedTest {
    data: Medium;
    
    init() {
        self.data = Medium{
            a: 5,
            b: Small{ x: 1 },
            c: "hello",
            d: Small{ x: 2 }
        };
    }
}