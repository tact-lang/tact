struct S {
    i: Int;
    b: Bool;
    s: String;
}

contract TestContract {
    arr0: S = S{i: 0, b: false, s: "zero"};
    arr1: S = S{i: 1, b: true, s: "one"};
    arr2: S = S{i: 2, b: false, s: "two"};
    arr3: S = S{i: 3, b: true, s: "three"};
    arr4: S = S{i: 4, b: false, s: "four"};
    arr5: S = S{i: 5, b: true, s: "five"};

    init() {
        self.arr0 = S{i: 10, b: true, s: "X"};
        self.arr1 = S{i: 11, b: false, s: "Y"};
        self.arr2 = S{i: 12, b: true, s: "Z"};
        self.arr3 = S{i:13, b:false, s:"P"};
        self.arr4 = S{i:14, b:true, s:"Q"};
        self.arr5 = S{i:15, b:false, s:"R"};
    }
    receive() {}
}