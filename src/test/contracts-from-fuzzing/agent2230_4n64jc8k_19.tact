struct ArrayLike {
    el1: Int;
    el2: Int;
    el3: Int;
    el4: Int;
    el5: Int;
}

contract FakeArray {
    arrData: ArrayLike;

    init() {
        self.arrData = ArrayLike{ el1:10, el2:20, el3:30, el4:40, el5:50 };
    }
}