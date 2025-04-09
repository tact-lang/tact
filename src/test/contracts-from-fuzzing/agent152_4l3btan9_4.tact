struct ManyFields {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Bool;
    f5: Bool;
    f6: Bool;
    f7: String;
    f8: String;
    f9: String;
    f10: Int;
}

contract TestContract {
    data: ManyFields;
    
    init() {
        self.data = ManyFields{
            f1: 1, f2: 2, f3: 3,
            f4: true, f5: false, f6: true,
            f7: "a", f8: "b", f9: "c",
            f10: 10
        };
    }
}
