message(1) M1 {
    x: Int;
}

message(2) M2 {
    m: M1;
    s: String;
}

struct Container {
    nestedMsg: M2;
}

contract NestedMsgsInStruct {
    cont: Container;

    init() {
        self.cont = Container{
            nestedMsg: M2{
                m: M1{x:5},
                s: "hi",
            }
        };
    }
}