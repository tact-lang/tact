struct IntStruct {
    a: Int;
    b: Int;
}

contract MultipleIntStorage {
    nums: IntStruct;

    init() {
        self.nums = IntStruct{a:5,b:7};
    }
}