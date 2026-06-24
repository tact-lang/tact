struct OptDeepInner {
    lvl2: Int?;
}

struct OptDeepOuter {
    lvl1: OptDeepInner?;
}

contract DeepOptStruct {
    val: OptDeepOuter;

    init() {
        self.val = OptDeepOuter{ lvl1: null };
    }
}