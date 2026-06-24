struct Leaf {
    val: Int?;
}

struct Branch1 {
    leaf: Leaf?;
}

struct Branch2 {
    branch1: Branch1?;
}

struct Branch3 {
    branch2: Branch2?;
}

contract TestContract {
    f1: Int?;
    f2: Int?;
    f3: Bool?;
    f4: Address?;
    deep: Branch3;

    init() {
        self.f1 = null;
        self.f2 = 123;
        self.f3 = true;
        self.f4 = null;
        self.deep = Branch3{
            branch2: Branch2{
                branch1: Branch1{
                    leaf: Leaf{
                        val: 42
                    }
                }
            }
        };
    }
}
