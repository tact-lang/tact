struct Child1 {
    a: Int;
}
struct Child2 {
    b: Int;
}
struct ParentStruct {
    c1: Child1;
    c2: Child2;
    val: Int;
}

contract MultiStructsTest {
    data: ParentStruct;

    init() {
        self.data = ParentStruct{
            c1: Child1{a:1},
            c2: Child2{b:2},
            val: 3
        };
    }
}
