struct Out {
    field1: Int;
    field2: String?;
    field3: Bool;
}

contract ManyTypes {
    val: Out;

    init() {
        self.val = Out{
            field1: 14,
            field2: "txt",
            field3: true
        };
    }
}
