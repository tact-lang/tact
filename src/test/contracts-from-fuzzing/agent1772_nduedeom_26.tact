struct OptionalPrimitive {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptPrimInState {
    data: OptionalPrimitive;

    init() {
        self.data = OptionalPrimitive{ x:null, y:null, z:null };
    }
}