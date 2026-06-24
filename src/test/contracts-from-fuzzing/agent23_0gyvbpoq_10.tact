struct LargeBoolInt {
    a: Bool;
    b: Int;
    c: Bool;
    d: Int;
    e: Bool;
    f: Int;
    g: Bool;
    h: Int;
    i: Bool;
    j: Int;
}

contract Zigzag {
    s: LargeBoolInt;

    init() {
        self.s = LargeBoolInt{
            a:true, b:1, c:false, d:2, e:true,
            f:3, g:false, h:4, i:true, j:5
        };
    }
}