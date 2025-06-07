struct OptLevel1 { val: Int?; }
struct OptLevel2 { l1: OptLevel1; }
struct OptLevel3 { l2: OptLevel2; }

contract OptionalNestedTest {
    receive() {
        let o = OptLevel3 { l2: OptLevel2 { l1: OptLevel1 { val: 50 } } };
        dump(o.l2.l1.val);
    }
}
