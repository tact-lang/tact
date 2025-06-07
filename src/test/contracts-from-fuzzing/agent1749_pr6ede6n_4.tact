struct ManyOptionals {
    o1: Int?;
    o2: Bool?;
    o3: Address?;
    o4: Cell?;
    o5: String?;
}

contract OptionalFields {
    data: ManyOptionals;
    init() {
        self.data = ManyOptionals{
            o1: null, o2: null, o3: null, o4: null, o5: null
        };
    }
}