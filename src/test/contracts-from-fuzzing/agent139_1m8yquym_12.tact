struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
    f: Slice?;
    g: Builder?;
    h: Int?;
    i: Bool?;
    j: String?;
}

contract ManyOptionalsTest {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a:null, b:null, c:null, d:null, e:null, f:null, g:null, h:null, i:null, j:null
        };
    }
}