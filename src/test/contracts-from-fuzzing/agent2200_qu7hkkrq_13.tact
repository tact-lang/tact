struct WideOptImplicit {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Cell?;
    f6: Slice?;
    f7: Builder?;
}

contract WideOptImplicitTest {
    wide: WideOptImplicit = WideOptImplicit{
        f1: 1,
        f2: true,
        f3: "hi",
        f4: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c")
    };
}