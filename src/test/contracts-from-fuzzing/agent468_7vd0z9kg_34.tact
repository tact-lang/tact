// Deep nested structs with defaults combining text, optionals, flags
struct Lvl3 {
    msg: String = "L3";
    flag: Bool = true;
    optInt: Int?;
}

struct Lvl2 {
    inner: Lvl3 = Lvl3{};
    note: String = "L2";
}

struct Lvl1 {
    inner: Lvl2 = Lvl2{};
    code: Int = 1;
}

contract NestedDefaults {
    val: Lvl1;

    init() {
        self.val = Lvl1{};
    }
}