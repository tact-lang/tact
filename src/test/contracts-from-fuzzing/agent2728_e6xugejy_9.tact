struct ManyNested {
    f1: String;
    f2: Bool;
    f3: Int;
    f4: String;
    f5: Bool;
    f6: Int;
    f7: String;
    f8: Bool;
    f9: Int;
}

struct Holder {
    nest1: ManyNested;
    nest2: ManyNested;
    nest3: ManyNested;
}

contract Test {
    field: Holder;

    init() {
        let nest = ManyNested{
            f1: "a", f2: true, f3: 1,
            f4: "b", f5: false, f6: 2,
            f7: "c", f8: true, f9: 3
        };
        self.field = Holder{
            nest1: nest,
            nest2: nest,
            nest3: nest
        };
    }
}
