struct Nested1 { 
    a: Int?; 
}

struct Nested2 {
    inner: Nested1?;
}

contract NestedNullable2 {
    data: Nested2;

    init() {
        self.data = Nested2{
            inner: null
        };
    }
}