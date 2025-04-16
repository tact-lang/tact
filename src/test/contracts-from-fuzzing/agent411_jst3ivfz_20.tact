struct NestedDefaults {
    a: Int = 1;
    b: Bool;
    c: Int?;
}

contract NestedDefaultContract {
    nd: NestedDefaults;

    init() {
        self.nd = NestedDefaults{ b:true, c:null };
    }
}