struct OptNest { x: Int?; y: Bool?; z: Address? }

contract OptionalDeepFields {
    state: OptNest;

    init() {
        self.state = OptNest{ x:null, y:true, z:null };
    }
}