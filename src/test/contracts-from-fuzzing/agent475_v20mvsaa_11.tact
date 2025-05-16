struct ManyOptionals {
    x: Int?;
    y: Bool?;
    z: Address?;
    s: String?;
    c: Cell?;
    sl: Slice?;
}

contract TestContract {
    opt: ManyOptionals;

    init() {
        self.opt = ManyOptionals{
            x: null,
            y: null,
            z: null,
            s: null,
            c: null,
            sl: null,
        };
    }

    receive() {}
}