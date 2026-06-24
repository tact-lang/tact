struct Mixed {
    a: Int;
    b: String?;
    c: Bool;
}

contract TestContract {
    fld: Mixed?;
    
    init() {
        self.fld = Mixed{ a: 1, b: null, c: true };
    }
}