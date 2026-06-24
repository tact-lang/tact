struct S {
    a: Int;
    b: Bool?;
}

contract Stored {
    val: S;

    init() {
        self.val = S{a:1, b:null};
    }
}
