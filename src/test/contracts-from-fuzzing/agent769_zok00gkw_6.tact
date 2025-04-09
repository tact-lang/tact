struct Combo_Nested1_Nested2 {
    txt: String?;
    addr: Address?;
}

struct Combo_Nested1 {
    flag: Bool;
    nested2: Combo_Nested1_Nested2;
}

struct Combo {
    optInt: Int?;
    optCell: Cell?;
    nested: Combo_Nested1;
}

contract TestContract {
    f: Combo;

    init() {
        self.f = Combo{
            optInt: null,
            optCell: null,
            nested: Combo_Nested1{
                flag: false,
                nested2: Combo_Nested1_Nested2{
                    txt: null,
                    addr: null,
                },
            },
        };
    }

    receive() {
        let _ = self.f.nested.nested2.txt;
    }
}