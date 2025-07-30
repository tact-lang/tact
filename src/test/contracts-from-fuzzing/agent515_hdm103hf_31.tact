// Test a contract with a long nested chain of structs ending with simple values
struct Bottom {
    num: Int;
    flag: Bool;
}

struct Mid1 { b: Bottom; }
struct Mid2 { m1: Mid1; }
struct Mid3 { m2: Mid2; }
struct Mid4 { m3: Mid3; }

contract LongChain {
    root: Mid4;

    init() {
        self.root = Mid4{
            m3: Mid3{
                m2: Mid2{
                    m1: Mid1{
                        b: Bottom{num:42, flag:true}
                    }
                }
            }
        };
    }
}