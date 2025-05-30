contract CastingTest {
    receive() {
        // Use extension function to convert Int literal to String
        let s: String = (42).toString();
        dump(s);
    }
}
