struct WeirdMix {
    flag: Bool;
    name: String;
    title: String;
}

contract TestContract {
    s: WeirdMix;

    init() {
        self.s = WeirdMix{
            flag: true,
            name: "X",
            title: "Y"
        };
    }
}
