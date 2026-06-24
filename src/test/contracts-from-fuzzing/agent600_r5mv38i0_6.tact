struct Inner {
    v: Int?;
}

struct Outer {
    nested: Inner?;
}

contract OptionalNestedStruct {
    data: Outer = Outer{nested: null};

    receive() {
        let _ = self.data;
    }
}