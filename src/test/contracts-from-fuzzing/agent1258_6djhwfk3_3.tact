struct LargeStruct {
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
}

contract LargeStructStorage {
    val: LargeStruct;

    init() {
        self.val = LargeStruct{
            a: 1, b:2, c:3, d:4, e:5,
            f:6, g:7, h:8, i:9, j:10,
        };
    }

    receive() {
        self.val = LargeStruct{
            a: self.val.a + 1,
            b: self.val.b + 1,
            c: self.val.c + 1,
            d: self.val.d + 1,
            e: self.val.e + 1,
            f: self.val.f + 1,
            g: self.val.g + 1,
            h: self.val.h + 1,
            i: self.val.i + 1,
            j: self.val.j + 1,
        };
    }
}