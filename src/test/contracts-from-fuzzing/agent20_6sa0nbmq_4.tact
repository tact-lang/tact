struct RecursionBase {
    val: Int;
}

struct RecursionNest1 {
    x: RecursionBase;
}

struct RecursionNest2 {
    y: RecursionNest1;
}

struct RecursionNest3 {
    z: RecursionNest2;
}

contract TestContract {
    storage: RecursionNest3;

    init() {
        self.storage = RecursionNest3{
            z: RecursionNest2{
                y: RecursionNest1{
                    x: RecursionBase{
                        val: 42,
                    },
                },
            },
        };
    }
}
