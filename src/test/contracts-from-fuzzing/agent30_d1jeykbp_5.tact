struct OptionalField {
    a: Int;
    b: Int?;
}

contract TestOptional {
    receive() {
        // Optional field set
        let opt1: OptionalField = OptionalField{ a: 100, b: 200 };
        // Optional field not set, using null
        let opt2: OptionalField = OptionalField{ a: 300, b: null };
        // Access the optional field from the first instance
        opt1.b;
    }
}
