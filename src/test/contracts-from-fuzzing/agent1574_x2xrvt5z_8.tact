struct Child {
    a: Int;
    b: Bool;
}

struct Parent {
    first: Child;
    second: Child;
    third: Child;
}

contract MultipleSameStruct {
    data: Parent;

    init() {
        self.data = Parent{
            first: Child{ a:1, b:true },
            second: Child{ a:2, b:false },
            third: Child{ a:3, b:true }
        };
    }
}