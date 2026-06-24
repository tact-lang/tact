struct LargeOptionals {
    opt1: Int?;
    opt2: Bool?;
    opt3: Address?;
    opt4: Cell?;
    opt5: String?;
    opt6: Int?;
    opt7: Bool?;
    opt8: Address?;
    opt9: Cell?;
    opt10: String?;
}

contract LargeOptionalStorage {
    opts: LargeOptionals;
    init() {
        self.opts = LargeOptionals{
            opt1: null, opt2: null, opt3: null, opt4: null, opt5: null,
            opt6: null, opt7: null, opt8: null, opt9: null, opt10: null,
        };
    }
}