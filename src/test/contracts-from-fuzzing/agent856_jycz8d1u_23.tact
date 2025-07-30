struct Reorder {
    a: Int;
    b: Bool;
    c: String;
}

contract AssignOrderTest {
    stuff: Reorder;

    init() {
        self.stuff = Reorder{ c:"hello", b:true, a:123 };
    }
}