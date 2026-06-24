// deeply nested optional struct in persistent var with initialization
struct In1 { v: Int?; }
struct In2 { i: In1?; }
struct In3 { i: In2?; }

contract DeepOptPersist {
    val: In3?;

    init() {
        self.val = null;
    }
}