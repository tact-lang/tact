struct DeepA { aa: Int }
struct DeepB { bb: DeepA }
struct DeepC { cc: DeepB }
struct DeepD { dd: DeepC }

struct Combo2 {
    one: Int;
    two: Bool;
    three: DeepD;
    four: String;
    five: Int?;
}

contract ComboDeepOpt {
    data: Combo2?;
    init() {
        self.data = Combo2{
            one: 23,
            two: false,
            three: DeepD{ dd: DeepC{ cc: DeepB{ bb: DeepA{ aa: 999 } } } },
            four: "test",
            five: null,
        };
    }
}