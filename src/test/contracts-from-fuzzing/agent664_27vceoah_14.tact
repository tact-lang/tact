struct ManyOptional {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
    e: Cell?;
    f: Slice?;
    g: Builder?;
}

contract ManyOptTest {
    data: ManyOptional;

    init() {
        self.data = ManyOptional{
            a:null, b:null, c:null, d:null, e:null, f:null, g:null
        };
    }
}
