struct BigNested {
    lv1: Lv1;
}

struct Lv1 {
    lv2: Lv2;
    lv2b: Lv2;
}

struct Lv2 {
    lv3: Lv3;
}

struct Lv3 {
    val: Int;
    val2: Bool;
    val3: String?;
}

contract Combo {
    payload: BigNested;

    init() {
        self.payload = BigNested{
            lv1: Lv1{
                lv2: Lv2{ lv3: Lv3{ val: 1, val2: true, val3: null } },
                lv2b: Lv2{ lv3: Lv3{ val: 2, val2: false, val3: "x" } }
            }
        };
    }
}