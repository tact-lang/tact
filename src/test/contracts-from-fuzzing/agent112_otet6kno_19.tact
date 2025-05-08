struct DeepNest {
    child: Child;
}

struct Child {
    grandChild: GrandChild;
}

struct GrandChild {
    val: Int;
    flag: Bool;
    text: String;
}

contract NestedLayers {
    data: DeepNest = DeepNest{
        child: Child{
            grandChild: GrandChild{
                val: 3, flag: true, text: "z"
            }
        }
    };

    init() {
        self.data = DeepNest{
            child: Child{
                grandChild: GrandChild{
                    val: 42, flag: false, text: "k"
                }
            }
        };
    }
}
