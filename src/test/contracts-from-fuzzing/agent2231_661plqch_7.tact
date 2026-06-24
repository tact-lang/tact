struct RecursiveNest3 {
    level: Int;
}

struct RecursiveNest2 {
    level: Int;
    inner3: RecursiveNest3;
}

struct RecursiveNest1 {
    level: Int;
    inner2: RecursiveNest2;
}

contract RecursiveNestContract {
    data: RecursiveNest1;

    init() {
        self.data = RecursiveNest1{
            level: 1,
            inner2: RecursiveNest2{
                level: 2,
                inner3: RecursiveNest3{
                    level:3
                }
            }
        };
    }
}