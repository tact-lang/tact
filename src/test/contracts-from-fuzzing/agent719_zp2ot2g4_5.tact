struct WideStruct {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Bool;
    h: Bool;
    i: Bool;
    j: Bool;
    k: String;
    l: String;
}

contract TestContract {
    data: WideStruct;
    init() {
        self.data = WideStruct{
            a:1, b:2, c:3, d:4, e:5, f:6,
            g:true, h:false, i:true, j:false,
            k:"k", l:"l"
        };
    }
}