struct OneFieldNested {
    x: Int;
}

struct TwoFieldNested {
    a: OneFieldNested;
    b: OneFieldNested;
}

struct ThreeFieldNested {
    a: TwoFieldNested;
    b: TwoFieldNested;
    c: TwoFieldNested;
}

contract DeepWideNested {
    val: ThreeFieldNested;

    init() {
        self.val = ThreeFieldNested{
            a: TwoFieldNested{
                a: OneFieldNested{x:1},
                b: OneFieldNested{x:2}
            },
            b: TwoFieldNested{
                a: OneFieldNested{x:3},
                b: OneFieldNested{x:4}
            },
            c: TwoFieldNested{
                a: OneFieldNested{x:5},
                b: OneFieldNested{x:6}
            }
        };
    }

    receive() {
        let _ = self.val;
    }
}