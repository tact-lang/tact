struct DeepMapLevel1 {
    a: Int;
    opt: Int?
}

struct DeepMapLevel2 {
    level1: DeepMapLevel1;
    m: map<Int, Int>
}

contract TestDeepOptionalMap {
    receive() {
        let d: DeepMapLevel2 = DeepMapLevel2 {
            level1: DeepMapLevel1 { a: 1, opt: null },
            m: emptyMap()
        };
        return;
    }
}
