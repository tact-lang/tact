struct Opts {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Slice?;
    o5: Cell?;
    o6: Address?;
}

contract TestStorage {
    opts: Opts;
    init() {
        self.opts = Opts{
            o1: null,
            o2: true,
            o3: null,
            o4: null,
            o5: emptyCell(),
            o6: myAddress()
        };
    }
}
