struct Data1 {
    val: Int;
}

struct Data2 {
    d1: Data1;
}

struct Data3 {
    d2: Data2;
}

contract ThreeLevelStorage {
    info: Data3;

    init() {
        self.info = Data3{
            d2: Data2{
                d1: Data1{val: 99}
            }
        };
    }
}