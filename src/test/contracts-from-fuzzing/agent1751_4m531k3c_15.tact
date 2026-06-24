struct WideStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
    g: Int;
    h: Bool;
    i: String;
}

contract MixOptPrimStruct {
    maybeCount: Int?;
    data: WideStruct;

    init() {
        self.maybeCount = null;
        self.data = WideStruct{
            a:1, b:true, c:"A",
            d:2, e:false, f:"B",
            g:3, h:true, i:"C"
        };
    }

    receive() {}
}