struct AA{ x: Int; }
struct BB{ a: AA; b: AA; }
struct CC{ arr: BB; val: Int; }

contract TestContract {
    d: CC;

    init() {
        self.d = CC {
            arr: BB {
                a: AA { x: 1 },
                b: AA { x: 2 },
            },
            val: 3,
        };
    }
}