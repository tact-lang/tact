contract OptionalTestInvalid {
    receive() {
        let maybe: Int? = 42;
        dump(maybe);
    }
}
