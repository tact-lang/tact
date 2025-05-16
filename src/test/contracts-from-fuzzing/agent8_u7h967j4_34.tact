struct RecNest2 {
    val: Int;
}

struct RecNest1 {
    rec: RecNest2;
}

struct RecNest0 {
    rec: RecNest1;
}

contract Recursion3 {
    val: RecNest0;

    init() {
        self.val = RecNest0 { rec: RecNest1 { rec: RecNest2 { val: 123 } } };
    }
}