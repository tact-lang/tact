struct HasManyOptionals {
    o1: Int?;
    o2: Int?;
    o3: String?;
    o4: Bool?;
    o5: Cell?;
    o6: Address?;
    o7: Slice?;
}

contract TestContract {
    data: HasManyOptionals;

    init() {
        self.data = HasManyOptionals{
            o1: 1,
            o2: null,
            o3: null,
            o4: true,
            o5: null,
            o6: null,
            o7: null
        };
    }
}