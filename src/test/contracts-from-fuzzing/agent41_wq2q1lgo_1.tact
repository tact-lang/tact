struct NestedOptionals {
    foo: Int?;
    bar: String?;
    buzz: Bool?;
    inner: InnerStruct?;
}

struct InnerStruct {
    num: Int;
    txt: String;
    flag: Bool;
}

contract TestContract {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            foo: null,
            bar: null,
            buzz: null,
            inner: null
        };
    }
}