struct WeirdCompose {
    a: Int?; 
    b: String; 
    c: Bool?;
}

contract OptionMixedStorage {
    s: WeirdCompose;

    init() {
        self.s = WeirdCompose{
            a: 55,
            b: "hi",
            c: null
        };
    }
}