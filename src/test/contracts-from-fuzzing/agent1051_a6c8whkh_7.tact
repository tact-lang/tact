struct Recursive1 {
    other: Recursive2;
}

struct Recursive2 {
    another: Recursive3;
}

struct Recursive3 {
    value1: Int;
    value2: Bool;
}

contract TestContract {
    rec: Recursive1;
    init() {
        self.rec = Recursive1{
            other: Recursive2{
                another: Recursive3{
                    value1: 5,
                    value2: true
                }
            }
        };
    }
}