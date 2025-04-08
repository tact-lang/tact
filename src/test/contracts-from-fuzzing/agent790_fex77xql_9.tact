struct Outer {
    nested1: Int;
    nested2: Int;
    nested3: Int;
}

contract MultipleAssignments {
    state: Outer;

    init() {
        self.state = Outer{nested1:1, nested2:2, nested3:3};
    }
}