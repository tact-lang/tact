struct BigNested1 {
    a: Int;
    b: Bool;
    s: String;
    addr: Address;
    c: Cell;
    sl: Slice;
}

struct BigNested2 {
    n1: BigNested1;
    n2: BigNested1;
}

contract ManyBigNested {
    d: BigNested2;

    init() {
        self.d = BigNested2{
            n1: BigNested1{
                a:1,b:true,s:"x",addr:myAddress(),c:emptyCell(),sl:emptyCell().asSlice()
            },
            n2: BigNested1{
                a:2,b:false,s:"y",addr:myAddress(),c:emptyCell(),sl:emptyCell().asSlice()
            }
        };
    }
}