struct A { i: Int; }
contract ManyAssignInit {
    a: A = A{ i:1 };
    opt: Int? = null;
    str: String = "hi";

    init() {
        self.a = A{ i:2 };
        self.opt = 123;
        self.str = "yo";
    }
}