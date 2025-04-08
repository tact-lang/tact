struct StrNest {
    a: String;
    b: InnerString;
}

struct InnerString {
    x: String;
    y: String?;
}

contract StringNestTest {
    dat: StrNest;
    init() {
        self.dat = StrNest{
            a: "1",
            b: InnerString{
                x: "2",
                y: null,
            }
        };
    }
}