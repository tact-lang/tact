struct WideStruct {
    a: Int;
    b: Bool;
    c: Int;
    d: String;
    e: Bool;
    f: Int;
    g: String;
    h: Bool;
    i: Int;
    j: String;
}

contract ManyFields {
    data: WideStruct;
    init() {
        self.data = WideStruct{
            a:1, b:true, c:2, d:"d", e:false, f:3, g:"g", h:true, i:5, j:"j"
        };
    }
}