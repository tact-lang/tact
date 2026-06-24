// Large chain of structs referencing other structs
struct LVL1 {
    f: LVL2;
}
struct LVL2 {
    f: LVL3;
}
struct LVL3 {
    f: LVL4;
}
struct LVL4 {
    f: LVL5;
}
struct LVL5 {
    f: LVL6;
}
struct LVL6 {
    val: Int;
}

contract TestContract {
    x: LVL1;
    init() {
        self.x = LVL1{
            f: LVL2{
                f: LVL3{
                    f: LVL4{
                        f: LVL5{
                            f: LVL6{val: 9}
                        }
                    }
                }
            }
        };
    }
}