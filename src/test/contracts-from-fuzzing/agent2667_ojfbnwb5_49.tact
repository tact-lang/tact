struct OptionalAllPrimitive {
    x: Int?;
    y: Bool?;
    z: Address?;
    s: String?;
}

contract OptionalAllPrimitiveContract {
    d: OptionalAllPrimitive;

    init() {
        self.d = OptionalAllPrimitive{x:null,y:null,z:null,s:null};
    }

    receive() {
        self.d = OptionalAllPrimitive{x:10,y:true,z:myAddress(),s:"hi"};
    }
}