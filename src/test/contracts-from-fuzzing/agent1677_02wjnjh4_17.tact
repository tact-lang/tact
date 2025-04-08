struct DeepOptCombo {
    a: Opt1?;
    b: Int?;
}

struct Opt1 {
    b: Opt2?;
}

struct Opt2 {
    c: Int?;
}

contract TestDeepOptCombo {
    data: DeepOptCombo = DeepOptCombo{ a:null, b:null };

    init() {
        self.data = DeepOptCombo{
            a: Opt1{ b: Opt2{ c: 777 } },
            b: 333
        };
    }
}
