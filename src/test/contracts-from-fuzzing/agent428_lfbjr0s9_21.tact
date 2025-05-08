// fuzzy combination: optional struct with nested optional struct and extra fields
struct Z {
    num: Int;
    text: String?;
}

struct Y {
    z: Z?;
    ok: Bool;
}

contract TestContract {
    data: Y?;
    flag: Bool = false;

    init() {
        self.data = null;
        self.flag = true;
    }
}