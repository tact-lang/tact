struct S {
    a: Int as int5;
    b: Int as uint3;
    c: Int as int1;
}

contract CustomWidths {
    s: S;
    init() {
        self.s = S{
            a: 5,
            b: 7,
            c: -1,
        };
    }
}