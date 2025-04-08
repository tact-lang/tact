struct TwoOpts {
    a: Int?;
    b: String?;
}

struct Comb {
    s: String;
    opt: TwoOpts;
}

contract NestedOptional {
    data: Comb;

    init() {
        self.data = Comb{
            s: "hi",
            opt: TwoOpts{
                a: null,
                b: "ok"
            }
        };
    }
}