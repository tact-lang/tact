struct ManyOptionals {
    o1: Int?;
    o2: Int?;
    o3: Bool?;
    o4: Address?;
    o5: Slice?;
    o6: Cell?;
    o7: String?;
    o8: Int?;
}

contract TestContract {
    options: ManyOptionals;

    init() {
        self.options = ManyOptionals{
            o1: null,
            o2: 2,
            o3: true,
            o4: null,
            o5: null,
            o6: null,
            o7: "hello",
            o8: null,
        };
    }
}
