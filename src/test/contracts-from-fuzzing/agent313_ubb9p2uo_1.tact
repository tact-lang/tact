struct InnerStruct {
    a: Int;
    b: Bool;
    c: String?;
}

contract DeepNested {
    data: InnerStruct;
    data2: InnerStruct;

    init() {
        self.data = InnerStruct{ a:1, b:true, c:null };
        self.data2 = InnerStruct{ a:2, b:false, c:"hi" };
    }
}