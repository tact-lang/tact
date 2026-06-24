// contract that combines explicit values and default values on struct
struct S {
    a: Int = 1;
    b: Bool? = null;
    c: String = "x";
}

contract TestContract {
    s: S;

    init() {
        self.s = S{a:5, b:true, c:"changed"};
    }
}