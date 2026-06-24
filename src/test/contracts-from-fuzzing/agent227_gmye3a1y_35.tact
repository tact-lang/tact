struct Recursion {
    child: Child?;
}

struct Child {
    value: Int;
}

contract TestContract {
    rec: Recursion;

    init() {
        self.rec = Recursion{ child: Child{ value: 1 } };
    }
}