// Nested optional persistent variable (only outer optional)
struct Inner {
    val: Int;
}

contract OptionalSingleLevel {
    data: Inner?;

    init() {
        self.data = Inner{
            val: 123
        };
    }
}