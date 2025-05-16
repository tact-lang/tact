struct InnerOptional {
    foo: Int = 3;
    bar: Bool? = true;
}

struct Outer {
    inner: InnerOptional?;
    label: String;
}

contract PersistOptStruct {
    field: Outer;

    init() {
        self.field = Outer{
            inner: null,  // intentionally skip nested optional struct
            label: "label"
        };
    }
}