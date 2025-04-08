struct S { x: Int }

contract Test {
    arr0: S;
    arr1: S;
    arr2: S;
    arr3: S;
    arr4: S;
    arr5: S;
    arr6: S;
    arr7: S;
    arr8: S;
    arr9: S;

    init() {
        self.arr0 = S{ x: 0 };
        self.arr1 = S{ x: 1 };
        self.arr2 = S{ x: 2 };
        self.arr3 = S{ x: 3 };
        self.arr4 = S{ x: 4 };
        self.arr5 = S{ x: 5 };
        self.arr6 = S{ x: 6 };
        self.arr7 = S{ x: 7 };
        self.arr8 = S{ x: 8 };
        self.arr9 = S{ x: 9 };
    }
}