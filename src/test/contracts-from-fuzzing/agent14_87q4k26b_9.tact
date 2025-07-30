struct RecA {
    val: Int;
}

struct RecB {
    ref: RecA?;
    val: Int;
}

struct RecC {
    ref: RecB?;
    val: Int;
}

contract RecursiveMiss {
    storage: RecC;
    init() {
        self.storage = RecC{
            ref: RecB{
                ref: RecA{ val: 3 },
                val: 2
            },
            val: 1
        };
    }
}