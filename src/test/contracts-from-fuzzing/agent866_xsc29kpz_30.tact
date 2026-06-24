struct IntStrings {
    val1: Int;
    val2: String;
    val3: String;
    val4: Int;
    val5: String;
}

contract Interleaved {
    v: IntStrings;
    init() {
        self.v = IntStrings{
            val1:1,
            val2:"a",
            val3:"b",
            val4:4,
            val5:"e"
        };
    }
}