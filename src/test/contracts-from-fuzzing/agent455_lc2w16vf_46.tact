struct Crazy {
    a: Int?;
    b: InnerCrazy?;
}

struct InnerCrazy {
    c: Bool?;
    d: String?;
    e: Int;
}

contract NutsContract {
    crazy: Crazy;

    init() {
        self.crazy = Crazy{
            a: null,
            b: InnerCrazy{
                c: null,
                d: null,
                e: 1,
            }
        };
    }
}