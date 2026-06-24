struct Combination {
    intVal: Int;
    boolVal: Bool;
    optInt: Int?;
    optString: String?;
    nested: Nested;
}

struct Nested {
    f1: Int;
    f2: Bool;
}

contract Combined {
    data: Combination;

    init() {
        self.data = Combination{
            intVal: 7,
            boolVal: false,
            optInt: 99,
            optString: null,
            nested: Nested{f1:1, f2:true}
        };
    }
}