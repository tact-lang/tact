struct DeepOptA {
    x: Int?;
    y: DeepOptB?;
}

struct DeepOptB {
    z: Int?;
}

contract DeepOptional {
    top: DeepOptA;

    init() {
        self.top = DeepOptA{ x:null, y:null };
    }
}