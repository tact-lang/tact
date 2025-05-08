struct Child1 { a: Int; }
struct Child2 { b: Bool; }
struct Parent {
    c1: Child1;
    c2: Child2;
    note: String?;
}

contract StructInStruct {
    data: Parent;

    init() {
        self.data = Parent{
            c1: Child1{a:5},
            c2: Child2{b:true},
            note: null
        };
    }
}