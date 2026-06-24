struct DeepDefaults {
    lvl1: Int = 1;
    nested: NestedDefaults;
}

struct NestedDefaults {
    lvl2: Int = 2;
    innerNested: InnerNestedDefaults;
}

struct InnerNestedDefaults {
    lvl3: Int = 3;
    finalVal: Int;
}

contract DeepDefaultStruct {
    info: DeepDefaults;

    init() {
        self.info = DeepDefaults{
            nested: NestedDefaults{
                innerNested: InnerNestedDefaults{ finalVal: 99 }
            }
        };
    }
}