struct Layer1 {
    val: Int;
    opt: Layer2?;
}

struct Layer2 {
    val: Int;
    opt: Layer3?;
}

struct Layer3 {
    val: Int;
    opt: Layer4?;
}

struct Layer4 {
    val: Int;
}

contract TestContract {
    layer: Layer1;

    init() {
        self.layer = Layer1 {
            val: 1,
            opt: Layer2 {
                val: 2,
                opt: Layer3 {
                    val: 3,
                    opt: null,
                },
            },
        };
    }
}