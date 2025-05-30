struct SimpleStruct { val: Int; }

contract UsesOutsideStruct {
    st: SimpleStruct;

    init() {
        self.st = SimpleStruct{ val: 100 };
    }
}