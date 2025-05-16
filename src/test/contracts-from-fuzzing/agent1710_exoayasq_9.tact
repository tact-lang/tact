struct Pair {
    x: Int;
    y: Int;
}

struct Cont1 { p: Pair }
struct Cont2 { c: Cont1 }
struct Cont3 { c: Cont2 }

contract Test {
    val: Cont3;

    init() {
        self.val = Cont3{
            c: Cont2{
                c: Cont1{
                    p: Pair{ x: 1, y: 2 }
                }
            }
        };
    }
}