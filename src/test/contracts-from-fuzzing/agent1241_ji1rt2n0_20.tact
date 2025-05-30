struct ManyOptionals {
    a: Int?; b: Bool?; c: Int?; d: Bool?; e: Int?; f: Bool?;
}

contract TestOptStruct {
    field: ManyOptionals;

    init() {
        self.field = ManyOptionals{
            a: null, b: true, c: null, d: false, e: 42, f: null
        };
    }
}
