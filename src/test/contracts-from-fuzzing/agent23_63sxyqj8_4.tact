struct Layer5 { v: Int }

struct Layer4 { v: Int; next: Layer5 }

struct Layer3 { v: Int; next: Layer4 }

struct Layer2 { v: Int; next: Layer3 }

struct Layer1 { v: Int; next: Layer2 }

contract Test {
    receive() {
        let nested: Layer1 = Layer1 {
            v: 1,
            next: Layer2 {
                v: 2,
                next: Layer3 {
                    v: 3,
                    next: Layer4 {
                        v: 4,
                        next: Layer5 { v: 5 }
                    }
                }
            }
        };
        return;
    }
}
