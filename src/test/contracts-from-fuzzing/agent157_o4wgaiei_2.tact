struct Nested {
    val1: Int;
    val2: Int?; 
    nested: Inner;
}

struct Inner {
    x: Int;
    y: Int;
}

contract DeepTest {
    data: Nested;

    init() {
        self.data = Nested{
            val1: 5,
            val2: null,
            nested: Inner{ x: 8, y: 9 }
        };
    }
}
