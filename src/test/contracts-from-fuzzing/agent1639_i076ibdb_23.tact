struct Leaf {
    a: Int?;
    b: Bool;
    rem: Slice as remaining;
}

struct Branch {
    leaf: Leaf?;
}

struct Root {
    branch: Branch;
}

contract TestContract {
    data: Root;

    init() {
        self.data = Root{
            branch: Branch{
                leaf: Leaf{
                    a: null,
                    b: true,
                    rem: "data".asComment().asSlice()
                }
            }
        };
    }
}