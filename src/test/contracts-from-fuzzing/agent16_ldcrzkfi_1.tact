struct NestedInner {
    val: Int;
    flag: Bool;
}

struct Outer {
    nested: NestedInner;
    str: String;
    optInt: Int?;
}

contract TestContract {
    complex: Outer;

    init() {
        self.complex = Outer{
            nested: NestedInner{ val: 42, flag: false },
            str: "hello",
            optInt: null
        };
    }
}