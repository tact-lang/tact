struct ManyOptionals {
    x: Int?;
    y: Bool?;
    z: String?;
    addr: Address?;
}

contract TestContract {
    opt: ManyOptionals;

    init() {
        self.opt = ManyOptionals{
            x: null,
            y: true,
            z: null,
            addr: null
        };
    }
}