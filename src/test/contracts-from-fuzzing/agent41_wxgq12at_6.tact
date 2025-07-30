struct OptionNested {
    p: Int?;
    q: String?;
}

struct MidOption {
    inner: OptionNested?;
    num: Int;
}

contract CompoundOptionStruct {
    data: MidOption;

    init() {
        self.data = MidOption{
            inner: null,
            num: 7,
        };
    }
}
