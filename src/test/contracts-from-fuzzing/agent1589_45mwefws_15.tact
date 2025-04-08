struct DeepOptionals {
    i: Int?;
    b: Bool?;
    s: String?;
    c: Cell?;
}

contract DeepOptNested {
    opt: DeepOptionals?;

    init() {
        self.opt = null;
    }
}