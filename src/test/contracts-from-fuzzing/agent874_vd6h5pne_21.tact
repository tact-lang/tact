struct Wrapper {
    val1: Int;
    val2: String;
}

contract OptStructField {
    test: Wrapper?;

    init() {
        self.test = Wrapper{
            val1: 42,
            val2: "Hi"
        };
    }
}
