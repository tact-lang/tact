struct TinyStruct {
    tinyVal: Int as uint3;
}

contract TinyFieldContract {
    val: TinyStruct;

    init() {
        self.val = TinyStruct{ tinyVal: 7 };
    }
}