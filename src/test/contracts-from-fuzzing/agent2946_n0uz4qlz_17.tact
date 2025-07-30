struct NestedNested {
    level: Nested2;
}

struct Nested2 {
    val: Int;
    flag: Bool;
}

contract TestNestedInsideStruct {
    store: NestedNested;
    init() {
        self.store = NestedNested{
            level: Nested2{
                val: 123,
                flag: false
            }
        };
    }
}