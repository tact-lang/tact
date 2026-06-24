struct SReorder {
    a: Int;
    b: Int as uint32;
    c: Bool;
    d: Int as int64;
    e: Bool;
}

contract SerializeVariants {
    s: SReorder;

    init() {
        self.s = SReorder{
            a:1, b:2, c:true, d:3, e:false,
        };
    }
}