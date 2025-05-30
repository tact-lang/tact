struct StructA {
    a: Int;
    b: Bool;
}

contract ManyStructVars {
    sa: StructA;
    saOpt: StructA?;

    init() {
        self.sa = StructA{ a: 7, b:true };
        self.saOpt = null;
    }
}