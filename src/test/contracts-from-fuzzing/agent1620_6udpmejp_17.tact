struct Levels3 {
    f1: Bool?;
    f2: InnerLev2;
}

struct InnerLev2 {
    a: Int?;
    b: LastLv;
}

struct LastLv {
    s: String;
    o: Int?;
}

contract DeepOptionals {
    val: Levels3;

    init() {
        self.val = Levels3{
            f1: true,
            f2: InnerLev2{
                a: null,
                b: LastLv{
                    s: "x",
                    o: 9
                }
            }
        };
    }
}