struct OptionalPrimitives {
    i:Int?; b:Bool?; s:String?; a:Address?;
}

contract OptPrims {
    ops: OptionalPrimitives;
    init() {
        self.ops = OptionalPrimitives{
            i:null,
            b:null,
            s:null,
            a:null
        };
    }
}
