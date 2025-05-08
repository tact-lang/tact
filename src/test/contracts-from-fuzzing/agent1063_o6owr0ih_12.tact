struct OptLevel1 { a: Int?; }
struct OptLevel2 { l1: OptLevel1?; }

contract OptDeep {
    val: OptLevel2;

    init() {
        self.val = OptLevel2{ l1: null };
    }
}