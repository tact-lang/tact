struct Child {
    val: Int = 10;
}

struct Parent {
    child: Child?;  // optional nested struct
    flag: Bool?;
}

contract TestContract {
    data: Parent = Parent{};
    init() {
        self.data = Parent{
            child: Child{val: 5},
            flag: true
        };
    }
}