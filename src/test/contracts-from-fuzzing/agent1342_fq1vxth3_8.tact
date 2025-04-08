struct ManyOptionals {
    a: Bool?;
    b: Int?;
    c: String?;
    d: Cell?;
}

contract OptFields {
    field: ManyOptionals;

    init() {
        self.field = ManyOptionals{
            a:true, b:null, c:"hi", d:null
        };
    }
}