struct Child1 { v: Int }
struct Child2 { v: Int }
contract SiblingNested {
    a: Child1;
    b: Child2;
    init() {
        self.a = Child1{ v:1 };
        self.b = Child2{ v:2 };
    }
}