contract TestOptional {
    receive() {
        // Optional literal assignment and non-null assertion
        let optInt: Int? = 42;
        let nonNullInt: Int = optInt!!;
        let optBool: Bool? = true;
        let nonNullBool: Bool = optBool!!;
    }
}
