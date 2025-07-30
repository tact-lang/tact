struct DefaultStruct {
    a: Int = 5;
    b: Bool = true;
    c: String = "ok";
    d: Int?;
}

contract Defaults {
    field: DefaultStruct;
    init() {
        self.field = DefaultStruct{a:10,b:false,c:"no",d:7};
    }
}