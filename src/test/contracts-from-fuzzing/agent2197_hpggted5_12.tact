struct NestedOne {
    f1: Int;
    f2: Bool;
}

struct NestedTwo {
    f3: Bool;
    f4: Int;
}

struct InContract {
    a: NestedOne;
    b: NestedTwo;
}

contract Combo {
    data: InContract;

    init() {
        self.data = InContract{
            a: NestedOne{f1:1,f2:true},
            b: NestedTwo{f3:false,f4:2}
        };
    }
}