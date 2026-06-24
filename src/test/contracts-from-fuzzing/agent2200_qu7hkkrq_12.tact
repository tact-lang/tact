struct WideOpt {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Cell?;
    f6: Slice?;
    f7: Builder?;
}

contract WideOptTest {
    wide: WideOpt = WideOpt{
        f1: 1,
        f2: true,
        f3: "hi",
        f4: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
        f5: null,
        f6: null,
        f7: null
    };
}