struct Message1 {
    n: Int;
    flag: Bool;
}

struct Message2 {
    m1: Message1;
    flag2: Bool;
}

contract TestContract {
    complex: Message2;

    init() {
        self.complex = Message2{
            m1: Message1{
                n:5,
                flag:true
            },
            flag2: false
        };
    }
}