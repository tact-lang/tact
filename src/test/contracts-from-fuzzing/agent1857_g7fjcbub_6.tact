struct Child {
    x: Int;
    y: String;
    z: Bool;
}

struct Parent {
    c1: Child;
    c2: Child;
    text: String;
}

contract ParentTest {
    par: Parent;

    init() {
        self.par = Parent{
            c1: Child{ x:1, y:"a", z:true },
            c2: Child{ x:2, y:"b", z:false },
            text: "parent"
        };
    }
}