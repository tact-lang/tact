struct Rec {
    item: Int;
}

struct Holder {
    r1: Rec;
    r2: Rec;
    r3: Rec;
    r4: Rec;
    r5: Rec;
}

contract DeepNestedManyStructs {
    data: Holder = Holder{
        r1: Rec{ item: 1 },
        r2: Rec{ item: 2 },
        r3: Rec{ item: 3 },
        r4: Rec{ item: 4 },
        r5: Rec{ item: 5 }
    };

    init() {}
}