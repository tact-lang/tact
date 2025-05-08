struct A {
    val1: Int;
    val2: Bool;
    val3: String;
    val4: Bool?;
    val5: Int?;
}

contract TestOptionalInStruct {
    field: A;

    init() {
        self.field = A{
            val1: 7,
            val2: true,
            val3: "yo",
            val4: null,
            val5: null,
        };
    }
}