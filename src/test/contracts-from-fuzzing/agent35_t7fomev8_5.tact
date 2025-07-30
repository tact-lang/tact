struct Layer1 {
    l2: Layer2;
}

struct Layer2 {
    l3: Layer3;
}

struct Layer3 {
    l4: Layer4;
}

struct Layer4 {
    val1: Int;
    val2: Bool;
    val3: String;
}

contract TestContract {
    field: Layer1;

    init() {
        self.field = Layer1 {
            l2: Layer2 {
                l3: Layer3 {
                    l4: Layer4 {
                        val1: 123,
                        val2: false,
                        val3: "deep",
                    }
                }
            }
        };
    }
}
