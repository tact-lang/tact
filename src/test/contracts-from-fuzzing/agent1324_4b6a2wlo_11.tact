struct Recursive1 {
    field1: Recursive2;
}

struct Recursive2 {
    field2: Int;
}

contract RecursiveTest {
    r: Recursive1;
    init() {
        self.r = Recursive1{
            field1: Recursive2{
                field2: 55
            }
        };
    }
}