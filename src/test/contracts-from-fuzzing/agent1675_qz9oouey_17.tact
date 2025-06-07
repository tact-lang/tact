struct NestedOptionals {
    i: Int?;
    b: Bool?;
    s: String?;
    a: Address?;
    c: Cell?;
    sl: Slice?;
}

contract NestedAndOptional {
    top: NestedOptionals?;

    init() {
        self.top = null;
    }
}