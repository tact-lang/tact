struct Tuple {
    val1: Int;
    val2: Bool;
    val3: Int;
    val4: String;
}

contract MultiTypeLiterals {
    t: Tuple = Tuple{
        val1: 42,
        val2: true,
        val3: 123,
        val4: "hello"
    };
}