struct OneFieldStruct {
    only: Int;
}

contract SingleStructVar {
    val: OneFieldStruct;

    init() {
        self.val = OneFieldStruct{ only: 500 };
    }
}
