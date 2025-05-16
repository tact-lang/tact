struct NestedDefaults {
    lvl1: Lvl1;
}

struct Lvl1 {
    lvl2: Lvl2;
}

struct Lvl2 {
    foo: Int = 5;
    bar: Bool?;
}

contract NestedDefaultsContract {
    store: NestedDefaults;

    init() {
        self.store = NestedDefaults{
            lvl1: Lvl1{
                lvl2: Lvl2{
                    bar: null
                }
            }
        };
    }
}