struct SomeStruct {
    a: Int;
}

contract OptionalStructField {
    optField: SomeStruct?;

    init() {
        self.optField = null;
    }

    receive() {
        if (self.optField != null) {
            let val = self.optField!!;
        }
    }
}