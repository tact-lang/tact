struct Rec2 {
    val: Int;
    s: String;
}

struct Rec1 {
    first: Rec2;
    second: Rec2;
}

struct Rec0 {
    head: Rec1;
    tail: Rec1;
}

contract NestedRecords {
    store: Rec0;

    init() {
        self.store = Rec0{
            head: Rec1{
                first: Rec2{val:1,s:"one"},
                second: Rec2{val:2,s:"two"},
            },
            tail: Rec1{
                first: Rec2{val:3,s:"three"},
                second: Rec2{val:4,s:"four"},
            },
        };
    }
}