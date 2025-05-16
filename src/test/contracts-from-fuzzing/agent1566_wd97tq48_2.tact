struct NestedLevel2 {
    val2: Int;
    str2: String;
}

struct NestedLevel1 {
    inner: NestedLevel2;
}

contract DeepNested {
    top: NestedLevel1;

    init() {
        self.top = NestedLevel1{
            inner: NestedLevel2{
                val2: 42,
                str2: "hello",
            },
        };
    }
}
