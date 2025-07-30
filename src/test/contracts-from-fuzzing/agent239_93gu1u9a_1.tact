struct NestedInner {
    foo: Int;
    bar: Bool?;
}

struct NestedOuter {
    val: NestedInner;
    label: String;
}

contract TestContract {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            val: NestedInner{foo: 123, bar: true},
            label: "hello",
        };
    }
}