struct Simple {
    num: Int;
}

contract TestContract {
    arr0: Simple;
    arr1: Simple;
    arr2: Simple;
    arr3: Simple;
    arr4: Simple;

    init() {
        self.arr0 = Simple{ num: 0 };
        self.arr1 = Simple{ num: 1 };
        self.arr2 = Simple{ num: 2 };
        self.arr3 = Simple{ num: 3 };
        self.arr4 = Simple{ num: 4 };
    }
}
