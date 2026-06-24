struct Child {
    val: Int;
    opt: Bool?;
}

struct Parent {
    child: Child;
    name: String;
    optValue: Int?;
}

contract TestContract {
    data: Parent;

    init() {
        self.data = Parent{
            child: Child{
                val: 100,
                opt: null
            },
            name: "parent",
            optValue: null
        };
    }
}