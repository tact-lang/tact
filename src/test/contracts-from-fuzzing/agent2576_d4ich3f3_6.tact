struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: String;
    f: Bool;
    g: Int;
    h: String;
    i: Bool;
    j: Int;
}

contract LargeStructField {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            a:1, b:true, c:"1", d:2, e:"2", f:false, g:3, h:"3", i:true, j:4
        };
    }
}