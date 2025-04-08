struct Data {
    count: Int;
    flag: Bool;
}

contract TestContract {
    arr1: Data;
    arr2: Data;
    arr3: Data;

    init() {
        self.arr1 = Data{ count: 1, flag: true };
        self.arr2 = Data{ count: 2, flag: false };
        self.arr3 = Data{ count: 3, flag: true };
    }
}