// contract persistent state using struct with optional primitive array-like workaround (simulate array via multiple fields)

struct ArraySim {
    f0: Int?;
    f1: Int?;
    f2: Int?;
    f3: Int?;
}

contract OptionalArraySim {
    data: ArraySim;

    init() {
        self.data = ArraySim{
            f0: null,
            f1: 1,
            f2: null,
            f3: 3,
        };
    }
}