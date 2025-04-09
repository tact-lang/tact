struct EmptyOptStruct {
    a: Int?;
    b: Bool?;
}

contract OptTesting {
    foo: EmptyOptStruct;
    bar: Int?;

    init() {
        self.foo = EmptyOptStruct{a:null,b:true};
        self.bar = 10;
    }
}
