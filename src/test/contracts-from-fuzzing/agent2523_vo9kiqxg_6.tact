struct FlatOptionals {
    v1: Int?;
    v2: Int?;
    v3: Int?;
    v4: Int?;
    v5: Int?;
    v6: Int?;
    v7: Int?;
    v8: Int?;
    v9: Int?;
    v10: Int?;
}

contract FlatOptionalsTest {
    data: FlatOptionals;

    init() {
        self.data = FlatOptionals {
            v1: null,
            v2: null,
            v3: null,
            v4: null,
            v5: null,
            v6: null,
            v7: null,
            v8: null,
            v9: null,
            v10: null,
        };
    }
}
