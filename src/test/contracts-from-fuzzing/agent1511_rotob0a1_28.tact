struct Rec1 {
    rec2: Rec2;
}

struct Rec2 {
    num: Int;
    optRec3: Rec3?;
}

struct Rec3 {
    text: String;
    ok: Bool;
}

contract RecursionOptional {
    data: Rec1;

    init() {
        self.data = Rec1{
            rec2: Rec2{
                num: 7,
                optRec3: null
            }
        };
    }
}
