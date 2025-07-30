struct Optionals {
    oi: Int?;
    ob: Bool?;
    os: String?;
    oa: Address?;
    oc: Cell?;
    osl: Slice?;
}

contract OptTest {
    data: Optionals;

    init() {
        self.data = Optionals{
            oi: 1,
            ob: true,
            os: "opt",
            oa: myAddress(),
            oc: emptyCell(),
            osl: emptyCell().asSlice()
        };
    }
}
