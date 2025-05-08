struct EmptyStruct {
    val: Int;
}

contract JustStruct {
    s: EmptyStruct;

    init() {
        self.s = EmptyStruct{ val: 1 };
    }

    receive() {
        self.s.val = 2;
    }
}