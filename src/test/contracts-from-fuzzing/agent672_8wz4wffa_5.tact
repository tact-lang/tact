struct StructWithManyOptionals {
    o1: Int?;
    o2: Bool?;
    o3: Slice?;
    o4: Cell?;
    o5: Address?;
}

contract OptionalsTest {
    state: StructWithManyOptionals;

    init() {
        self.state = StructWithManyOptionals{
            o1: null,
            o2: null,
            o3: null,
            o4: null,
            o5: null
        };
    }
}