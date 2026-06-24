struct StringOpt {
    val: String?;
}

struct IntOpt {
    num: Int?;
}

struct StructCombo {
    sOpt: StringOpt;
    iOpt: IntOpt;
}

contract ComboOptional {
    value: StructCombo;

    init() {
        self.value = StructCombo{
            sOpt: StringOpt{ val: null },
            iOpt: IntOpt{ num: null }
        };
    }
}