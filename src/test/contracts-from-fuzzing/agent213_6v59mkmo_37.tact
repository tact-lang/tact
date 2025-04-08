struct Optionals {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract Opt {
    o: Optionals;
    init() {
        self.o = Optionals{ x:null, y:null, z:null };
    }
}