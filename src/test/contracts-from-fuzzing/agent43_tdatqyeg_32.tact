struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract UsesNestedOptionals {
    x: NestedOptionals;

    init() {
        self.x = NestedOptionals{
            a:null, b:null, c:null, d:null, e:null, f:null
        };
    }
}