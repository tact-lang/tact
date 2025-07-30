struct S {
    x: Int?;
}

contract TestContract {
    val: S;

    init() {
        self.val = S{x:null};
    }

    receive() {}
}