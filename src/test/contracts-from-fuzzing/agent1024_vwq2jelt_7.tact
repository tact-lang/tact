struct BigFields {
    int1: Int;
    bool1: Bool;
    int2: Int;
    bool2: Bool;
    int3: Int;
    bool3: Bool;
    int4: Int;
    bool4: Bool;
    int5: Int;
    bool5: Bool;
}

contract BigFieldsContract {
    field: BigFields;

    init() {
        self.field = BigFields{
            int1: 1, bool1: true,
            int2: 2, bool2: false,
            int3: 3, bool3: true,
            int4: 4, bool4: false,
            int5: 5, bool5: true
        };
    }
}