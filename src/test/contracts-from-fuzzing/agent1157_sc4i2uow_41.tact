struct ABool { val: Bool }
struct AInt { val: Int }
struct AStr { val: String }

struct Combo {
    a: ABool;
    b: AInt;
    c: AStr;
}

contract StructMix {
    m: Combo;

    init() {
        self.m = Combo{
            a: ABool{ val: true },
            b: AInt{ val: 42 },
            c: AStr{ val: "hi" }
        };
    }
}