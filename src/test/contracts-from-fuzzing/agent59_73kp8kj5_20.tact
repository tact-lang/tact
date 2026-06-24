struct NestedWithOptionals {
    one: Int?;
    two: Bool?;
    three: Address?;
    four: Cell?;
    five: Slice?;
    six: String?;
}

contract ManyNestedOptionals {
    n1: NestedWithOptionals? = null;
    n2: NestedWithOptionals? = null;
    n3: NestedWithOptionals? = null;
    n4: NestedWithOptionals? = null;
    n5: NestedWithOptionals? = null;
}
