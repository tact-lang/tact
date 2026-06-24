struct OptStruct {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract TestContract {
    opt1: OptStruct?;
    opt2: OptStruct?;

    init() {
        self.opt1 = null;
        self.opt2 = OptStruct{ x: null, y: null, z: null };
    }
}