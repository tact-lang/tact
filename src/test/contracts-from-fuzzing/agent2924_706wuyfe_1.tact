struct OptionLevel3 {
    val: Int?;
}

struct OptionLevel2 {
    nested: OptionLevel3?;
}

struct OptionLevel1 {
    nested: OptionLevel2?;
}

contract DeepOptionals {
    complexField: OptionLevel1?;

    init() {
        self.complexField = OptionLevel1{
            nested: OptionLevel2{
                nested: OptionLevel3{ val: 7 }
            }
        };
    }
}