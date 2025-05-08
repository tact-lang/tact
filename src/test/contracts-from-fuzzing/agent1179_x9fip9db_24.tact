struct Sibling1 {
    value: Int;
}

struct Sibling2 {
    value: Bool?;
}

struct Parent {
    left: Sibling1;
    right: Sibling2;
}

contract SiblingTest {
    data: Parent;

    init() {
        self.data = Parent{
            left: Sibling1{value:99},
            right: Sibling2{value:null}
        };
    }

    receive() {}
}