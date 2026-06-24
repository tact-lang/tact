struct Level3 {
    s: String;
    i: Int?;
}

struct Level2 {
    b: Bool;
    nested3: Level3?;
}

struct Level1 {
    a: Address;
    nested2: Level2?;
}

contract DeepNestedContract {
    state: Level1;

    init() {
        self.state = Level1{
            a: myAddress(),
            nested2: Level2{
                b: true,
                nested3: Level3{
                    s: "deep",
                    i: 11,
                },
            },
        };
    }

    receive() {
        let _ = self.state.a;
        if (self.state.nested2 != null) {
            let l2 = self.state.nested2!!;
            let b_val: Int = 0;
            if (l2.b) {
                b_val = 1;
            } else {
                b_val = 0;
            }
            let _ = b_val;
            if (l2.nested3 != null) {
                let l3 = l2.nested3!!;
                let _ = l3.s;
                if (l3.i != null) {
                    let _ = l3.i!!;
                }
            }
        }
    }
}