struct BigStruct {
    val1: Int;
    val2: Bool;
    val3: Int?;
    val4: Bool?;
    val5: String;
    val6: String?;
}

contract ManyTypes {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            val1: 123,
            val2: true,
            val3: null,
            val4: false,
            val5: "hello",
            val6: null,
        };
    }
}