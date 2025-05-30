struct OneField {
    number: Int;
}

struct Holder1 {
    f1: OneField;
}
struct Holder2 {
    f2: Holder1;
}
struct Holder3 {
    f3: Holder2;
}
struct Holder4 {
    f4: Holder3;
}
struct Holder5 {
    f5: Holder4;
}

contract TestContract {
    deeply: Holder5;

    init() {
        self.deeply = Holder5{
            f5: Holder4{
                f4: Holder3{
                    f3: Holder2{
                        f2: Holder1{
                            f1: OneField{ number: 123 }
                        }
                    }
                }
            }
        };
    }
}