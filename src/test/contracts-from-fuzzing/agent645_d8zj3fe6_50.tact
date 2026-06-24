struct Innermost {
    val: Int;
}
struct Middle {
    inner: Innermost;
}
struct OuterMost {
    mid: Middle;
}

contract OuterMostContract {
    field: OuterMost;

    init() {
        self.field = OuterMost{
            mid: Middle{
                inner: Innermost{ val: 42 }
            }
        };
    }
}
