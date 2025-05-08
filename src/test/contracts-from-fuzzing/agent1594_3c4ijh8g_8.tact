struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
    g: Int?;
    h: Int?;
    i: String?;
    j: Bool?;
    k: Int?;
    l: Cell?;
    m: Slice?;
    n: Address?;
}

contract TestNulls {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{};
    }

    receive() {}
}