struct BigStruct {
    val1: Int;
    val2: Bool;
    name: String;
    active: Bool;
    number: Int;
    flag: Bool;
}

contract ManyFields {
    storage: BigStruct;
    
    init() {
        self.storage = BigStruct{
            val1: 1,
            val2: true,
            name: "Hello",
            active: false,
            number: 42,
            flag: true,
        };
    }
}
