struct Nested2 {
    val2: Int?;
}

struct Nested1 {
    nested2: Nested2?;
}

contract ManyNestedOptionalFields {
    value: Nested1?; 

    init() {
        self.value = null;
    }
}