struct Rec1 {
    n: Int;
    optInner: Rec2?;
}

struct Rec2 {
    flag: Bool;
    text: String;
}

contract RecursiveOptionalTest {
    rec: Rec1;

    init() {
        self.rec = Rec1{
            n: 5,
            optInner: Rec2{
                flag: true,
                text: "hi"
            }
        };
    }
}
