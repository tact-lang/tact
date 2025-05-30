struct Elem {
    val: Int?;
}

struct ElemArray {
    e1: Elem?;
    e2: Elem?;
    e3: Elem?;
    e4: Elem?;
}

contract TestContract {
    arr: ElemArray;

    init() {
        self.arr = ElemArray{
            e1:null,
            e2:Elem{val:42},
            e3:null,
            e4:Elem{val:10},
        };
    }
}