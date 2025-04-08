struct Base1 { a: Int; }
struct Base2 { b: Bool; }
struct Combo {
    f1: Base1;
    f2: Base2;
    optBase1: Base1?;
    optBase2: Base2?;
}

contract MultiStruct {
    data: Combo;
    init() {
        self.data = Combo{
            f1: Base1{a: 1},
            f2: Base2{b: true},
            optBase1: null,
            optBase2: Base2{b: false}
        };
    }
}