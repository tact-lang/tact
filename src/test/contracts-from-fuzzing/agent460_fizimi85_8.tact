struct Leaf {
    val: Int = 5;
    flag: Bool = true;
}

struct Middle {
    leaf: Leaf;
    name: String = "default";
}

struct Root {
    middle: Middle;
    description: String = "rootdesc";
}

contract DefaultsNestedStruct {
    data: Root;

    init() {
        self.data = Root{
            middle: Middle{
                leaf: Leaf{},   // rely on defaults
            }
            // description defaults
        };
    }
}