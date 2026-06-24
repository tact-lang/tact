struct BigOptional {
    x: Int?;
    y: Bool?;
    s: String?;
    c: Cell?;
    a: Address?;
    sl: Slice?;
}

contract TestContract {
    val: BigOptional;

    init() {
        self.val = BigOptional{
            x: null,
            y: null,
            s: null,
            c: null,
            a: null,
            sl: null
        };
    }
}