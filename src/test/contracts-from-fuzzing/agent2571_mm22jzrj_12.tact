struct Container {
    bigInt: Int;
    bigStr: String;
    optionalInt: Int?;
    optionalStr: String?;
}

contract NestedStructs {
    field1: Container;
    field2: Container;

    init() {
        self.field1 = Container{bigInt:1, bigStr:"one", optionalInt:null, optionalStr:null};
        self.field2 = Container{bigInt:2, bigStr:"two", optionalInt:5, optionalStr:"z"};
    }
}
