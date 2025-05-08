struct InnerTraitStruct2 {
    data: Int?;
}

trait MyUniqueTrait {
    baseStruct: InnerTraitStruct2;
}

contract DerivedContract with MyUniqueTrait {
    baseStruct: InnerTraitStruct2;

    init() {
        self.baseStruct = InnerTraitStruct2{
            data: null
        };
    }
}