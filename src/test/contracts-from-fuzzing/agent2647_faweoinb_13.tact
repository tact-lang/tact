struct InnerStruct {
    val: Int;
}

struct Container {
    opt_inner: InnerStruct?;
    str_val: String;
}

contract OptNestedStruct {
    data: Container;

    init() {
        self.data = Container{
            opt_inner: null,
            str_val: "test"
        };
    }
}