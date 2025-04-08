struct MyStruct {
    a: Int?;
    b: Bool;
    c: String?;
    d: Int;
    e: Bool?;
}

contract Test {
    s: MyStruct;
    init() {
        self.s = MyStruct{
            a:null,
            b:true,
            c:"hello",
            d:5,
            e:null
        };
    }
}