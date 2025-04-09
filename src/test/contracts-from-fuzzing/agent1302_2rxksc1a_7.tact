struct Inner {
    flag: Bool;
    txt: String;
}

contract Test {
    arr0: Inner;
    arr1: Inner;
    arr2: Inner;
    arr3: Inner;
    arr4: Inner;
    arr5: Inner;
    arr6: Inner;
    arr7: Inner;
    arr8: Inner;
    arr9: Inner;

    init() {
        let sample = Inner{ flag: true, txt: "hi" };
        self.arr0 = sample;
        self.arr1 = sample;
        self.arr2 = sample;
        self.arr3 = sample;
        self.arr4 = sample;
        self.arr5 = sample;
        self.arr6 = sample;
        self.arr7 = sample;
        self.arr8 = sample;
        self.arr9 = sample;
    }
}