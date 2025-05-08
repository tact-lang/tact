struct StringStruct {
    info: String;
}

contract StoreStringStruct {
    s: StringStruct;

    init() {
        self.s = StringStruct{info:"hello world"};
    }
}
