struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
    g: Int;
    h: Bool;
    i: String;
    j: Int;
    k: Bool;
    l: String;
}

contract LargeStructContract {
    s: LargeStruct;
    init() {
        self.s = LargeStruct{
            a:1, b:true, c:"c", d:4, e:false, f:"f", g:7, h:true,
            i:"i", j:10, k:false, l:"l"
        };
    }
    receive() {}
}