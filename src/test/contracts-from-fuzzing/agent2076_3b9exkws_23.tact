struct RecursiveDeep {
    deeper: Deep2;
}

struct Deep2 {
    deeper2: Deep3;
}

struct Deep3 {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    a: Address;
}

contract TestContract {
    data: RecursiveDeep;

    init() {
        self.data = RecursiveDeep{
            deeper: Deep2{
                deeper2: Deep3{
                    i:123,b:true,s:"hi",c:emptyCell(),a:myAddress()
                }
            }
        };
    }
}