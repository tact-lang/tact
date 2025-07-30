struct ManyOptionals {
    o1: Int?;
    o2: Int?;
    o3: String?;
    o4: Bool?;
    o5: String?;
    o6: Bool?;
    o7: Int?;
    o8: String?;
}

contract TestContract {
    manyopt: ManyOptionals;
    init() {
        self.manyopt = ManyOptionals{
            o1: null,
            o2: 5,
            o3: "hi",
            o4: null,
            o5: "yo",
            o6: false,
            o7: 42,
            o8: null
        };
    }
}