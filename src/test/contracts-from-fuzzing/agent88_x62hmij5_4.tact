struct Optionals {
    x: Int?;
    y: Bool?;
    z: Address?;
    w: Cell?;
}

contract TestOpt {
    opt: Optionals;
    init() {
        self.opt = Optionals{
            x: null, y: null, z: null, w: null
        };
    }
    receive() {}
}