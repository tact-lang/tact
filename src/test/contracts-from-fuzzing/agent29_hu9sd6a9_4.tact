struct LongStruct {
    a: Int;
    b: Bool;
    c: Bool?;
    d: Int;
    e: String;
    f: Bool;
    g: String;
    h: Int;
    i: Bool?;
    j: Int;
}

contract ManyFields {
    data: LongStruct;

    init() {
        self.data = LongStruct{
            a: 1, b: true, c: null, d:2, e:"hi", f:false, g:"there", h:3, i:true, j:4
        };
    }
}