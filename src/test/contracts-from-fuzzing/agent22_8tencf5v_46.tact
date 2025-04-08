// Push edge: wide struct, nested optional struct chain with mixed explicit defaults
struct Leaf {
    x:Int = 0;
    y:String? = null;
}

struct Branch {
    l1: Leaf? = null;
    l2: Leaf? = null;
    f: Bool = false;
}

contract ExtremeMix {
    s1: Branch;
    s2: Branch;
    str: String = "default";
    flag: Bool? = null;

    init() {
        self.s1 = Branch{};
        self.s2 = Branch{};
        self.str = "changed";
        self.flag = null;
    }
}