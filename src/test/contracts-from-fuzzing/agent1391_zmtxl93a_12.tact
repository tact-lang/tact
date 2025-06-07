struct Child {
    x: Int;
}

struct Parent {
    y: Int;
    child: Child;
}

contract OptNestedStructTest {
    data: Parent?;
    
    init() {
        self.data = null;
    }
}