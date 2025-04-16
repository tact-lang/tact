struct A { val: Int; opt: Bool?; }
struct B { nested: A; optStr: String?; }

contract TestContract {
    aField: A;
    bField: B;

    init() {
        self.aField = A{ val:10, opt:true };
        self.bField = B{ nested:self.aField, optStr:null };
    }
}