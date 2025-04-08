struct S2 {
    a: Int;
    b: Bool;
}

contract StructWithDefaultNullOptional {
    val: S2? = null;

    init() {
        self.val = S2{a:5,b:true};
    }
}