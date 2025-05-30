struct Flags {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
}

contract ManyBools {
    data: Flags;

    init() {
        self.data = Flags{ a:true, b:false, c:true, d:false, e:true, f:false, g:true, h:false };
    }
}