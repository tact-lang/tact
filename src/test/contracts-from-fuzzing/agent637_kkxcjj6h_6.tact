struct ManyOptionals {
    o1: Int?;
    o2: Bool?;
    o3: Address?;
    o4: Cell?;
    s: String?;
}

contract Test {
    opts: ManyOptionals = ManyOptionals{};
    init() {}
    receive() {}
}