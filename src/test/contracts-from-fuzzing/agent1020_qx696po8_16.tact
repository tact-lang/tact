struct OptionsLevel1 {
    x: Int?;
    lvl2: OptionsLevel2?;
}

struct OptionsLevel2 {
    b: Bool?;
    lvl3: OptionsLevel3?;
}

struct OptionsLevel3 {
    s: String?;
}

contract NestedOptionals3 {
    data: OptionsLevel1;

    init() {
        self.data = OptionsLevel1{
            x: null,
            lvl2: null
        };
    }
}