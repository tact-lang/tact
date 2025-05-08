struct OneField {
    val: Int;
}

struct Nested1 {
    inner: OneField;
}

struct Nested2 {
    nested: Nested1;
}

struct Nested3 {
    nested2: Nested2;
}

contract DeepChain {
    field: Nested3;

    init() {
        self.field = Nested3{
            nested2: Nested2{
                nested: Nested1{
                    inner: OneField{ val: 321 }
                }
            }
        };
    }
}