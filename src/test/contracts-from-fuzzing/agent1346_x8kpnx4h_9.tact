struct OptionalPrimitives {
    x: Int?;
    y: Bool?;
    s: String?;
}

contract BarefieldsOptional {
    opt: OptionalPrimitives;

    init() {
        self.opt = OptionalPrimitives{x:null, y:null, s:null};
    }
}