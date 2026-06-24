// Deep optional chain
struct Level3 {
    foo: Int;
}

struct Level2 {
    l3: Level3?;
}

struct Level1 {
    l2: Level2?;
}

contract TestContract {
    l1: Level1;

    init() {
        self.l1 = Level1{l2: null};
    }

    receive() {
        if (self.l1.l2 != null) {
            if (self.l1.l2!!.l3 != null) {
               let _ = self.l1.l2!!.l3!!.foo;
            }
        }
    }
}