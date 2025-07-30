struct Level4 { d: Int?; }

struct Level3 { c: Level4?; }

struct Level2 { b: Level3?; }

struct Level1 { a: Level2?; }

contract TestContract {
    deepOpt: Level1;

    init() {
        self.deepOpt = Level1{
            a: Level2{
                b: Level3{
                    c: Level4{
                        d: 1234
                    }
                }
            }
        };
    }

    receive() {
        if (self.deepOpt.a != null) {
            let l2 = self.deepOpt.a!!;
            if (l2.b != null) {
                let l3 = l2.b!!;
                if (l3.c != null) {
                    let l4 = l3.c!!;
                    let val = l4.d;
                }
            }
        }
    }
}