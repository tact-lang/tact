struct ManyOptionals {
    o1: Int?;
    o2: Bool?;
    o3: Address?;
    o4: Cell?;
    o5: Slice?;
    o6: String?;
}

contract OptStorage {
    data: ManyOptionals;
    init() {
        self.data = ManyOptionals{
            o1: null,
            o2: true,
            o3: null,
            o4: null,
            o5: null,
            o6: null,
        };
    }
}