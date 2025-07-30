struct OptStruct {
    a: Int?;
    b: Int?;
}

contract TestOptFields {
    receive() {
        // Create a struct instance with one field set and the other null
        let s: OptStruct = OptStruct { a: 15, b: null };
        // Non-null assertion for field 'a' which is set
        let x: Int = s.a!!;
        dump(x); // Expect to dump 15

        // Check field 'b' and use different logic if null
        if (s.b == null) {
            dump(999); // Expect to dump 999
        } else {
            dump(s.b!!);
        }
    }
}
