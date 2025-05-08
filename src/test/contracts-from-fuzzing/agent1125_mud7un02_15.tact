struct OptionalLists {
    o1: Int?;
    o2: String?;
    o3: Bool?;
    o4: Address?;
    o5: Cell?;
    o6: Slice?;
}

contract TestContract {
    o: OptionalLists;

    init() {
        self.o = OptionalLists{
            o1: null,
            o2: null,
            o3: null,
            o4: null,
            o5: null,
            o6: null,
        };
    }
}