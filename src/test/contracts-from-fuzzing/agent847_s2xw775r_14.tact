struct DefaultsVsExplicit {
    a: Bool = true;
    b: Int = 5;
    c: String;
    d: Address;
    e: String?;
}

contract DefaultMix {
    data: DefaultsVsExplicit;

    init() {
        self.data = DefaultsVsExplicit{
            c: "hi",
            d: myAddress(),
            e: null
        };
    }
}