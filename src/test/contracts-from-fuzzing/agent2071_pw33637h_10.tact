struct SubStruct1 {
    s: String;
}

struct SubStruct2 {
    flag: Bool;
}

struct SubStruct3 {
    num: Int;
}

contract MultiTypeFields {
    f1: SubStruct1;
    f2: SubStruct2;
    f3: SubStruct3;
    f4: SubStruct1;
    f5: SubStruct2;
    f6: SubStruct3;

    init() {
        self.f1 = SubStruct1{ s: "hi" };
        self.f2 = SubStruct2{ flag: true };
        self.f3 = SubStruct3{ num: 1 };
        self.f4 = SubStruct1{ s: "bye" };
        self.f5 = SubStruct2{ flag: false };
        self.f6 = SubStruct3{ num: 2 };
    }
}