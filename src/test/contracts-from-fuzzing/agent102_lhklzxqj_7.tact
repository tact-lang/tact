contract TestContract {
    receive() {
        // Testing the round-trip conversion: String -> Slice -> String
        let original: String = "Hello, Tact!";
        let roundTrip: String = original.asSlice().asString();
        if (original == roundTrip) {
            dump("equal");
        } else {
            dump("not equal");
        }
    }
}
