struct A { x: Int; }
struct B { y: A; }
struct C { z: B; }

contract DeepContract {
    value: C;

    init() {
        self.value = C {
            z: B {
                y: A { x:42 }
            }
        };
    }
}