struct LargeTuple {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int;
    f5: Address;
    f6: Bool;
    f7: String;
    f8: Int;
}

contract LargeTupleTest {
    data: LargeTuple;

    init() {
        self.data = LargeTuple{
            f1:1, f2:true, f3:"a", f4:4, f5: myAddress(), f6:false, f7:"b", f8:8,
        };
    }
}
