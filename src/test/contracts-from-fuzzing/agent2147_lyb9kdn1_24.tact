struct Child {
    a: Int = 7;
}

struct Parent {
    child: Child? = Child{};
}

contract OptStructDefConst {
    field: Parent = Parent{};
}