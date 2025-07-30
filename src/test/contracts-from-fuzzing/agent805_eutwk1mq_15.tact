struct Child {
    val: Int;
    label: String;
}

struct Parent {
    child: Child;
    tag: String;
}

contract TestContract {
    const VALUE: Parent = Parent{
        child: Child{
            val: 42,
            label: "child"
        },
        tag: "root"
    };

    receive() {}
}