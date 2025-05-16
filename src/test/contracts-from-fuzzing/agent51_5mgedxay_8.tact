contract OptionalTest {
    receive() {
        let opt: Int? = null;
        if (opt != null) {
            let sum: Int = opt!! + 10;
        }
    }
}
