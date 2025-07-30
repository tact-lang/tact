struct BoolStruct {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
}

contract TestContract {
    data: BoolStruct;

    init() {
        self.data = BoolStruct{b1:true, b2:false, b3:true, b4:false};
    }
}