struct VeryDeep {
    a: Int;
    b: Bool;
    c: String;
}

contract PersistentVars {
    v1: VeryDeep;
    v2: VeryDeep;

    init() {
        self.v1 = VeryDeep { a:1, b:true, c:"hi" };
        self.v2 = VeryDeep { a:2, b:false, c:"bye" };
    }
}