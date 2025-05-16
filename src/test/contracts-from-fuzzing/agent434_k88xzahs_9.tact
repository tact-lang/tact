struct LargeOptionals {
    a: Int?;
    b: String?;
    c: Address?;
    d: Cell?;
    e: Slice?;
}

contract TestContract {
    dat: LargeOptionals;

    init() {
        self.dat = LargeOptionals{
            a: null,
            b: "hello",
            c: null,
            d: emptyCell(),
            e: emptyCell().asSlice()
        };
    }
}