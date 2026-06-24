struct Cascade1 {
    a:Int;
}
struct Cascade2 {
    b:Cascade1;
}
struct Cascade3 {
    c:Cascade2;
}
struct Cascade4 {
    d:Cascade3;
}
struct Cascade5 {
    e:Cascade4;
}

contract CascadeChain {
    val: Cascade5;

    init() {
        self.val = Cascade5{
            e: Cascade4{
                d: Cascade3{
                    c: Cascade2{
                        b: Cascade1{
                            a: 123
                        }
                    }
                }
            }
        };
    }
}