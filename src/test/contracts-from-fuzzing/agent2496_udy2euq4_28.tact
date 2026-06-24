struct MixedInDefaultStruct {
    i: Int = 7;
    b: Bool = false;
    s: String = "yo";
    o: Int?;
}

contract MixedDefaults {
    val: MixedInDefaultStruct;

    init() {
        self.val = MixedInDefaultStruct{
            o: null
        };
    }
}
