struct HasManyOptionals {
    i: Int?;
    b: Bool?;
    s: String?;
    a: Address?;
    c: Cell?;
    bl: Builder?;
}

contract OptionalStructDefault {
    f: HasManyOptionals;

    init() {
        self.f = HasManyOptionals{
            i: null, b:null, s:null, a:null, c:null, bl:null
        };
    }
}