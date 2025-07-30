struct OptionalInsideStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract NestedOptionals {
    x: Int;
    y: OptionalInsideStruct;

    init() {
        self.x = 123;
        self.y = OptionalInsideStruct{
            a:null,b:null,c:null
        };
    }
}
