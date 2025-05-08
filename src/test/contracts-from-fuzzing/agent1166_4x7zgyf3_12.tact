struct List1 { a: Int; }
struct List2 { a: List1; b: List1; }
struct List3 { a: List2; b: List2; }

contract NestedRepetition {
    val: List3;

    init() {
        self.val = List3{
            a: List2{
                a: List1{a:1},
                b: List1{a:2}
            },
            b: List2{
                a: List1{a:3},
                b: List1{a:4}
            }
        };
    }
}
