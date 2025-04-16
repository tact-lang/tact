struct ManyDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Int = 4;
    e: Int = 5;
    f: Int = 6;
    g: Int = 7;
    h: Int = 8;
    i: Int = 9;
    j: Int = 10;
}

contract MassDefaults {
    vals: ManyDefaults;

    init() {
        self.vals = ManyDefaults{
            a:11, b:12, c:13, d:14, e:15, f:16, g:17, h:18, i:19, j:20
        };
    }
}