struct Struct2 {
    k: Int;
}

struct Struct1 {
    j: Int;
    sub2: Struct2;
}

struct Cascade {
    i: Int;
    sub1: Struct1;
}

contract CascadeTest {
    val: Cascade;

    init() {
        self.val = Cascade{
            i: 1,
            sub1: Struct1{
                j: 2,
                sub2: Struct2{
                    k: 3
                }
            }
        };
    }
}