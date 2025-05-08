struct NestedDeepDefaults {
    lvl1: Inner1;
    flag: Bool;
}

struct Inner1 {
    lvl2: Inner2;
    count: Int;
}

struct Inner2 {
    x: Int = 8;
    y: Bool = true;
    z: Int? = null;
}

contract ContractNestedDefaults {
    data: NestedDeepDefaults = NestedDeepDefaults{
        lvl1: Inner1{lvl2: Inner2{}, count:0},
        flag: false
    };

    init() {
        self.data = NestedDeepDefaults{
            lvl1: Inner1{lvl2: Inner2{}, count:0},
            flag: false
        };
    }
}