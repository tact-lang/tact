struct Inner {
    val1: Int;
    val2: Bool;
    val3: String;
}

contract NestedStructTest {
    data: Inner;

    init() {
        self.data = Inner{
            val1: 10,
            val2: true,
            val3: "nested"
        };
    }
}