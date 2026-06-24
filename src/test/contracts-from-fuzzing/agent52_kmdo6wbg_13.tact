contract OptionalTest {
    receive() {
        let maybe: Int? = 42;
        let value: Int = maybe!!;
        dump(value);
    }
}
