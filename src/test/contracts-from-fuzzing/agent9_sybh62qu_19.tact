struct LeafInt { val: Int }
struct LeafBool { val: Bool }
struct LeafStr { val: String }

struct MidOpt {
    i: LeafInt?;
    b: LeafBool?;
    s: LeafStr?;
}

contract EdgeNullCases {
    data: MidOpt?;
    init() {
        self.data = MidOpt{
            i: null,
            b: null,
            s: LeafStr{ val: "hello" },
        };
    }
}