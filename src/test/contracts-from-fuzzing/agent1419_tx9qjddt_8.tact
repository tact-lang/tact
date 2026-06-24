struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
    g: Int?;
    h: Int?;
    i: Int?;
    j: Int?;
}

contract ManyOptionalsTest {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a:null, b:1, c:2, d:null, e:3,
            f:null, g:4, h:null, i:5, j:null
        };
    }
}