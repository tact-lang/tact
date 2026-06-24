// Deep param nesting chain
struct LevelC {
    val: Int;
}

struct LevelB {
    lc: LevelC;
}

struct LevelA {
    lb: LevelB;
}

contract ParamDeep(
    la: LevelA
) {
    receive() {
        let _ = self.la.lb.lc.val;
    }
}