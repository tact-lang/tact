struct DeepOptional {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct Wrap {
    d: DeepOptional;
}

contract TestContract {
    data: Wrap;

    init() {
        self.data = Wrap{ d: DeepOptional{ x:null, y:true, z:null } };
    }
}