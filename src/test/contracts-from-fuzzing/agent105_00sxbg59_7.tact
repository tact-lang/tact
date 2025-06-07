struct S1 { flag: Bool; }
struct S2 { nested: S1; opt: Int?; }
contract NestedOptional {
    data: S2;

    init() {
        self.data = S2{
            nested: S1{ flag: true },
            opt: null,
        };
    }
}