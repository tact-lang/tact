struct SubStruct1 {
    f1: Int;
    f2: String;
    f3: Bool;
}

struct SubStruct2 {
    f4: String;
    f5: Int?;
    f6: Bool;
}

contract WideStructTest {
    s1: SubStruct1;
    s2: SubStruct2;

    init() {
        self.s1 = SubStruct1{ f1: 1, f2: "abc", f3: true };
        self.s2 = SubStruct2{ f4: "def", f5: 42, f6: false };
    }
}