struct BoolStruct {
    b: Bool;
}

contract BoolStructTest {
    s: BoolStruct;

    init() {
        self.s = BoolStruct{b:true};
    }
}