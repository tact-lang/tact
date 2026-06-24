struct Nested {
    val1: Int;
    optVal: Bool?;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{
            val1: 1,
            optVal: true,
        };
    }
}