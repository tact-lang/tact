// testing nested struct with string default
struct Stuff {
    info: String = "default info";
    code: Int = 99;
}

struct Outer {
    nested: Stuff;
    note: String;
}

contract Test26 {
    o: Outer;
    init() {
        self.o = Outer{
            nested: Stuff{},
            note: "note"
        };
    }
}