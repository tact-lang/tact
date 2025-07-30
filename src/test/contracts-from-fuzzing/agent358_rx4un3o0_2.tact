struct InnerStruct {
    flag: Bool = false;
    count: Int = 0;
    text: String = "";
    optInt: Int?;  
}

contract WideContract {
    bigStruct: InnerStruct;

    init() {
        self.bigStruct = InnerStruct{
            flag: true,
            count: 123,
            text: "hello",
            optInt: 77
        };
    }
}
