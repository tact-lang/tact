struct ManyOptionals {
    f1: Int?;
    f2: Bool?;
    f3: String?;
    f4: Int?;
    f5: Bool?;
    f6: String?;
}

contract OptionalsStruct {
    storage: ManyOptionals;

    init() {
        self.storage = ManyOptionals{
            f1: null, f2: null, f3: null,
            f4: null, f5: null, f6: null
        };
    }
}