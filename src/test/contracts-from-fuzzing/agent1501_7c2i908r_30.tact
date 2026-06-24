struct Pair {
    a: Int;
    b: Int;
}

contract TestContract {
    arr1: Pair;
    arr2: Pair;
    arr3: Pair;

    init() {
        self.arr1 = Pair{ a:1, b:2 };
        self.arr2 = Pair{ a:3, b:4 };
        self.arr3 = Pair{ a:5, b:6 };
    }
}