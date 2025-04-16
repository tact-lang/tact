struct Data {
    optStr: String?;
    optBool: Bool?;
    optInt: Int?;
}

contract Foo {
    data: Data;

    init() {
        self.data = Data{optStr:null, optBool:null, optInt:null};
    }
}