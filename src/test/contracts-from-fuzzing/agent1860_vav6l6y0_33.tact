struct TwoStrs {
    s1: String;
    s2: String;
}

contract EmptyThenInit {
    val: TwoStrs;

    init() {
        self.val = TwoStrs{ s1:"hey", s2:"ho" };
    }
}