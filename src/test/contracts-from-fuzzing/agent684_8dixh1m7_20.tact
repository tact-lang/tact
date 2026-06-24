struct BoolFlags {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
}

contract ManyBools {
    flags: BoolFlags;
    init() {
        self.flags = BoolFlags {
            a:true, b:false, c:true, d:false, e:true
        };
    }
}