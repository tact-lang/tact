struct OptRec1 {
    f: Int?;
}

struct OptRec2 {
    s: OptRec1?;
}

contract OptRecursion {
    val: OptRec2?;
    init() {
        self.val = null;
    }
}
