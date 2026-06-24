struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Slice?;
    e: String?;
    f: Address?;
    g: Int?;
    h: Bool?;
    i: Cell?;
    j: Slice?;
}

contract ManyOptTest {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a: 1, b: false, c: emptyCell(), d: emptyCell().asSlice(), e: "s",
            f: myAddress(), g: 2, h: true, i: emptyCell(), j: emptyCell().asSlice()
        };
    }
}
