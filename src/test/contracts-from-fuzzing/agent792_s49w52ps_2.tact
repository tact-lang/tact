struct A {
    val1: Int;
    val2: Bool;
    val3: Cell;
    val4: Address;
    val5: String;
    val6: Int?;
    val7: Bool?;
    val8: Cell?;
    val9: Address?;
    val10: String?;
}

contract TestContract {
    fieldA: A;

    init() {
        self.fieldA = A{
            val1: 1,
            val2: true,
            val3: emptyCell(),
            val4: myAddress(),
            val5: "test",
            val6: null,
            val7: null,
            val8: null,
            val9: null,
            val10: null
        };
    }
}