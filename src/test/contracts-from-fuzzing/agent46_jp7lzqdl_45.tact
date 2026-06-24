message(0xF1) MStruct { value: Int }

contract MsgAsField {
    m: MStruct;

    init() {
        self.m = MStruct{ value: 42 };
    }
}
