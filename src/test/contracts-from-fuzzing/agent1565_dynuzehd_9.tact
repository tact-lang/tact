struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Slice?;
    f: Cell?;
    g: Builder?;
}

contract OptFieldsTest {
    field: ManyOptionals;

    init() {
        self.field = ManyOptionals{
            a:null, b:null, c:null,
            d:null, e:null, f:null, g:null
        };
    }
}