struct NestedInner {
    foo: Int;
    bar: Bool;
}

struct OuterStruct {
    nested: NestedInner;
    label: String;
}

contract NestedStructTest {
    val: OuterStruct;

    init() {
        self.val = OuterStruct{
            nested: NestedInner{
                foo: 7,
                bar: false
            },
            label: "nest"
        };
    }
}
