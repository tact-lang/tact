struct Child {
    text: String;
}

struct Parent {
    child: Child;
    number: Int;
}

contract WithDefaults {
    state: Parent = Parent{ child: Child{ text: "hello" }, number: 123 };
}