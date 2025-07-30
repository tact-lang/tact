struct ManyInts {
    a: Int = 0;
    b: Int = 1;
    c: Int = 2;
    d: Int = 3;
    e: Int = 4;
    f: Int = 5;
    g: Int = 6;
    h: Int = 7;
    i: Int = 8;
    j: Int = 9;
}

contract ManyFields {
    data: ManyInts = ManyInts{
        a:0, b:1, c:2, d:3, e:4, f:5, g:6, h:7, i:8, j:9
    };

    init() {
        self.data = ManyInts{
            a:9, b:8, c:7, d:6, e:5, f:4, g:3, h:2, i:1, j:0
        };
    }
}