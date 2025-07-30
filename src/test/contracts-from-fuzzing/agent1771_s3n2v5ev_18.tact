trait T1 { val1: Int }
trait T2 { val2: Int }

contract MultiTraitInherit with T1, T2 {
    val1: Int;
    val2: Int;

    init() {
        self.val1 = 1;
        self.val2 = 2;
    }
}