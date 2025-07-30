struct A {
    value: Int;
}

struct B {
    optA: A?;
}

contract OptionalNestedStruct {
    field: B = B{optA: null};

    receive() {
        if (self.field.optA != null) {
            let _ = self.field.optA!!.value;
        }
    }
}