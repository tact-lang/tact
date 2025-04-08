struct Inner1 {
    x: Int;
}

struct Inner2 {
    y: Bool;
}

struct NestedOptStruct {
    field1: Inner1?;
    field2: Inner2?;
}

contract NullableStructTest {
    data: NestedOptStruct;

    init() {
        self.data = NestedOptStruct{
            field1: Inner1{ x: 99 },
            field2: null
        };
    }
}
