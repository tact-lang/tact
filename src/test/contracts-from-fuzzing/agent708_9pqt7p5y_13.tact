struct LargeOptStruct {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
    f: Slice?;
}

contract NullablePacked {
    val: LargeOptStruct?;

    init() {
        self.val = null;
    }
}
