struct Opts {
    o1: Int?;
    o2: Bool?;
    o3: Address?;
    o4: String?;
    o5: Cell?;
}

contract Test {
    val: Opts;

    init() {
        self.val = Opts{
            o1: null,
            o2: true,
            o3: null,
            o4: null,
            o5: null,
        };
    }
}