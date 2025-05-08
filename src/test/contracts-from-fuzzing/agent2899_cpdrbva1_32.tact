struct Middle1 { a: Int; }
struct Middle2 { b: Int; }
struct TopLevel {
    m1: Middle1;
    m2: Middle2;
}

contract MultipleStructsField {
    top: TopLevel;

    init() {
        self.top = TopLevel{ m1: Middle1{a:1}, m2: Middle2{b:2} };
    }
}
