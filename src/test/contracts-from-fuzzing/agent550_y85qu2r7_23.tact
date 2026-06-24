struct Weird {
    a: Int;
    b: Bool;
    c: String;
    d: Bool;
    e: Int;
    f: Int?;
    g: Bool?;
    h: String?;
}

contract WeirdMix {
    val: Weird;

    init() {
        self.val = Weird{
            a: 1, b:true, c:"hi", d:false, e:5, f:null, g:null, h:null
        };
    }
}