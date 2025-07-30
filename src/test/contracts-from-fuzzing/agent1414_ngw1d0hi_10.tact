struct Rec2 {
    x: Int;
    y: Int;
}

struct Rec1 {
    rec2: Rec2;
    label: String?;
}

contract NestedStructOpt {
    nested: Rec1;

    init() {
        self.nested = Rec1{
            rec2: Rec2{ x: 10, y: 20 },
            label: "hi"
        };
    }
}