struct OptStruct {
    val: Int?;
    txt: String?;
    nested: Nested?;
}

struct Nested {
    foo: Int;
}

contract TestContract {
    s: OptStruct;

    init() {
        self.s = OptStruct{
            val: null,
            txt: null,
            nested: null
        };
    }
}