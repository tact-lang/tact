struct S {
   x: Int;
}

contract EarlyAssign {
    s: S;
    init() {
        let temp = S{ x: 777 };
        self.s = temp;
    }
}