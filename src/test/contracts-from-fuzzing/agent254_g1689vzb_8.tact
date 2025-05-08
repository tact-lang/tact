struct MultipleOptionals {
    o1: Int?;
    o2: Bool?;
    o3: Address?;
    o4: String?;
    o5: Cell?;
}

contract ManyNulls {
    s: MultipleOptionals;

    init() {
        self.s = MultipleOptionals{
            o1: null,
            o2: null,
            o3: null,
            o4: null,
            o5: null
        };
    }
}