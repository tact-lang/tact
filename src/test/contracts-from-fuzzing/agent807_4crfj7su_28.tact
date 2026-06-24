// test struct with 3 nested levels, deepest level optional
struct Lv3 {
    val: Int?;
}

struct Lv2 {
    lvl3: Lv3;
}

struct Lv1 {
    lvl2: Lv2;
}

contract DeepOptionalNest {
    state: Lv1;
    init() {
        self.state = Lv1{ lvl2: Lv2{ lvl3: Lv3{ val: null } } };
    }
}