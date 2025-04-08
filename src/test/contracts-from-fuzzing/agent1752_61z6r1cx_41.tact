struct Data1 { a: Int; }
struct Data2 { b: Int; }

contract CrossTypeFields {
    f1: Data1;
    f2: Data2;

    init() {
        self.f1 = Data1{a: 1};
        self.f2 = Data2{b: 2};
    }
}