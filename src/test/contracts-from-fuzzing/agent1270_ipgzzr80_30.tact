struct TestStruct {
    a: Int;
}

contract F {
    arr0: Int;
    arr1: Bool;
    arr2: String;
    arr3: Int?;
    arr4: Bool?;
    arr5: String?;
    arr6: TestStruct;
    arr7: TestStruct?;

    init() {
        self.arr0 = 1;
        self.arr1 = true;
        self.arr2 = "hello";
        self.arr3 = null;
        self.arr4 = false;
        self.arr5 = null;
        self.arr6 = TestStruct{a:5};
        self.arr7 = null;
    }
}