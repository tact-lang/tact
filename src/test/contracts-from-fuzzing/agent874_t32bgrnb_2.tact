struct Nested1 {
    a: Int;
}

struct Nested2 {
    inner: Nested1;
}

struct Nested3 {
    inner2: Nested2;
}

contract DeepNestedTest {
    data: Nested3;

    init() {
        self.data = Nested3{
            inner2: Nested2{
                inner: Nested1{
                    a: 10
                }
            }
        };
    }
}