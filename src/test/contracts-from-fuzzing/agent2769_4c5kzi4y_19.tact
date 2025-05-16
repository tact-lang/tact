struct Data1 {
    v: Int?;
}

struct Data2 {
    v: Int;
}

contract MixedOptionals {
    d1: Data1;
    d2: Data2;

    init() {
        self.d1 = Data1{v: null};
        self.d2 = Data2{v: 100};
    }
}