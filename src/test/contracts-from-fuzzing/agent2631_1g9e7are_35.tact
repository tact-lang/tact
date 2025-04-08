struct S {
    a: Int;
    b: Bool;
}

contract StructDefaultValueOnField {
    val: S = S{a: 1, b: false};

    init() {
        self.val = S{a:10, b:true};
    }
}