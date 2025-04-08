struct NestedOptional {
    inner: InnerStruct?;
}

struct InnerStruct {
    val: Int;
    txt: String;
}

contract TestContract {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{ inner: null };
    }
}