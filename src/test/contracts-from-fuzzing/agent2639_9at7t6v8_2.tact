struct Inner {
    val1: Int;
    val2: Bool;
    val3: String;
}

contract NestedStructTest {
    data: Inner;
    
    init() {
        self.data = Inner{
            val1: 42,
            val2: false,
            val3: "text"
        };
    }
}