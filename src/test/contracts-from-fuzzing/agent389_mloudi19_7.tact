struct LargeNested {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Int;
    h: Int;
    i: Int;
    j: Int;
    k: Int;
}

contract LargeContract {
    big: LargeNested;

    init() {
        self.big = LargeNested{
            a:1, b:2, c:3, d:4, e:5, f:6, g:7, h:8, i:9, j:10, k:11
        };
    }
}
