struct Recursive1 {
    n: Recursive2;
}
struct Recursive2 {
    n: Recursive3;
}
struct Recursive3 {
    n: Recursive4;
}
struct Recursive4 {
    val: Int;
}

contract RecursiveDeep {
    rec: Recursive1;

    init() {
        self.rec = Recursive1{
            n: Recursive2{
                n: Recursive3{
                    n: Recursive4{
                        val:99
                    }
                }
            }
        };
    }
}