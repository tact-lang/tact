struct OptionalStruct {
    value: Int?;
}

contract TestOptional {
    receive() {
        // Instantiate with non-null value
        let a = OptionalStruct{ value: 123 };
        dump(a.value);
    }
}
