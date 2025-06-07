struct ManyOptionals {
    o1: Int?;
    o2: String?;
    o3: Bool?;
    o4: Address?;
    o5: Cell?;
    o6: Slice?;
    o7: Builder?;
    o8: Int?;
    o9: Cell?;
}

contract OptsTest {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{};
    }
}