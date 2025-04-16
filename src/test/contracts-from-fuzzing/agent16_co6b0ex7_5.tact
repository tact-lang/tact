struct LongStruct {
    a: Int;
    b: Int;
    c: Int;
    d: Bool;
    e: Bool;
    f: Int;
    g: Bool;
    h: Int;
    i: Bool;
    j: Int;
}

contract LongStructField {
    data: LongStruct;

    init() {
        self.data = LongStruct{
            a:1, b:2, c:3, d:true, e:false, f:4, g:true, h:5, i:false, j:6
        };
    }
}