struct RecA {
    b: Bool;
    s: String?;
    i: Int;
}

contract Test {
    arr1: RecA;
    arr2: RecA;
    arr3: RecA;

    init() {
        let rec = RecA{b: true, s: null, i: 10};
        self.arr1 = rec;
        self.arr2 = rec;
        self.arr3 = rec;
    }
}
