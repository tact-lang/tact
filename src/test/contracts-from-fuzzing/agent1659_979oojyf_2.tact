struct DeeplyNested {
    lvl1: Lvl2?;
}

struct Lvl2 {
    lvl2_field: Lvl3?;
}

struct Lvl3 {
    num: Int;
}

contract TestContract {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{ lvl1: null };
    }
}