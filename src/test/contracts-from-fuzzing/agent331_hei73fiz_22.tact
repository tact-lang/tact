struct NestedMix {
    i: Int;
    optS: String?;
    optI: Int?;
    flag: Bool;
}

contract MixOptionalPersistence {
    data: NestedMix;

    init() {
        self.data = NestedMix{
            i:42, optS:null, optI:5, flag:true
        };
    }
}