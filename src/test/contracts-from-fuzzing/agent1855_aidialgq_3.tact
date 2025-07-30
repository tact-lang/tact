struct DeepOptional {
    x: Int?;
    y: Bool?;
    z: String?;
    c: Cell?;
    s: Slice?;
    a: Address?;
}

contract TestContract {
    myOpt: DeepOptional;

    init() {
        self.myOpt = DeepOptional{
            x: null,
            y: null,
            z: null,
            c: null,
            s: null,
            a: null,
        };
    }
}