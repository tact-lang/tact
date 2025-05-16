struct ManyNestedOptionals {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Slice?;
    o5: Cell?;
}

contract TestContract {
    field: ManyNestedOptionals?;

    init() {
        self.field = null;
    }
}