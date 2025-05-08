struct Nested1 {
    value: Int;
}
struct Nested2 {
    n1: Nested1;
}
struct Nested3 {
    n2: Nested2;
}

contract Chain {
    rec: Nested3;

    init() {
        self.rec = Nested3{n2: Nested2{n1: Nested1{value: 10}}};
    }
}