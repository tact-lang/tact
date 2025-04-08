struct Rec {
    val: Int;
}

contract InitAssignManyTimes {
    s: Rec;

    init() {
        self.s = Rec{val:1};
        self.s = Rec{val:2};
    }
}