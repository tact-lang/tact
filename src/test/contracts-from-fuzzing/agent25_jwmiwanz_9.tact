struct Sub1 { x: Int; }
struct Sub2 { a: Sub1; }
struct Sub3 { b: Sub2; }
struct Sub4 { c: Sub3; }
struct Sub5 { d: Sub4; }

contract StorageChain {
    val: Sub5;

    init() {
        self.val = Sub5{
            d: Sub4{
                c: Sub3{
                    b: Sub2{
                        a: Sub1{
                            x: 5
                        }
                    }
                }
            }
        };
    }
}
