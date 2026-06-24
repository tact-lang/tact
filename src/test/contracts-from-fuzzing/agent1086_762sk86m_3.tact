struct OptStruct {
    foo: Int?;
    bar: Bool?;
    nested: Nested?;
}

struct Nested {
    val: Int;
}

contract TestContract {
    data: OptStruct = OptStruct{
        foo: null,
        bar: null,
        nested: null
    };

    init() {
        self.data = OptStruct{
            foo: 10,
            bar: true,
            nested: Nested{ val: 1 }
        };
    }
}