struct A { f: Int; }
struct B { f: Int; }

contract ABFields {
    x: A = A{ f:1 };
    y: B = B{ f:2 };
    z: Int = 3;

    init() {
        self.x = A{ f: 10 };
        self.y = B{ f: 20 };
        self.z = 30;
    }
}