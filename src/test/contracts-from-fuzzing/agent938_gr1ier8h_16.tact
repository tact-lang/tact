struct LargeStruct {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Bool;
    f: String;
    g: Bool;
    h: Int;
    i: String;
    j: Bool;
}

contract LargeStructContract {
    big: LargeStruct;

    init() {
        self.big = LargeStruct{
            a:1, b:2, c:3, d:4, e:true,
            f:"A", g:false, h:5, i:"B", j:true,
        };
    }
}
