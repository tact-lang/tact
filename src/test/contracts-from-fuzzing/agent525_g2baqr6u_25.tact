// complex nested default values for struct fields
struct Child {
    a: Int = 1;
    b: Bool = false;
    c: String? = null;
}

struct Parent {
    child: Child;
    strOpt: String?;
}

contract Test {
    p: Parent;

    init() {
        self.p = Parent{ child: Child{}, strOpt: null };
    }
}