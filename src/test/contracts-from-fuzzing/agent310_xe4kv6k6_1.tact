struct ComplexStruct {
    val1: Int;
    val2: Bool;
    val3: Int?;
    val4: Bool?;
    val5: String;
    val6: String?;
}

contract ManyTypesTest {
    data: ComplexStruct;

    init() {
        self.data = ComplexStruct{
            val1: 5,
            val2: true,
            val3: null,
            val4: false,
            val5: "Hi",
            val6: null
        };
    }
}