struct Data {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract Test46 {
    d: Data;

    init() {
        self.d = Data{ x:null, y:null, z:null };
    }
}