struct BoolStruct {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
}

contract BoolPackedContract {
    data: BoolStruct;

    init() {
        self.data = BoolStruct{a:true, b:false, c:true, d:false, e:true, f:true, g:false, h:true};
    }
}