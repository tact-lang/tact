struct NestedStructLarger {
    s1: LargeStruct;
    s2: LargeStruct;
}

struct LargeStruct {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: String;
    f5: Cell;
    f6: Int?;
    f7: Bool;
    f8: Address;
    f9: String;
    f10: Cell;
}

contract TestContract {
    data: NestedStructLarger;
    init() {
        self.data = NestedStructLarger{
            s1: LargeStruct{
                f1: 1, f2: true, f3: myAddress(), f4: "a", f5: emptyCell(),
                f6: null, f7: false, f8: myAddress(), f9: "b", f10: emptyCell()
            },
            s2: LargeStruct{
                f1: 2, f2: false, f3: myAddress(), f4: "c", f5: emptyCell(),
                f6: null, f7: true, f8: myAddress(), f9: "d", f10: emptyCell()
            }
        };
    }
}
