message M1 {}

struct S1 {
    payload: M1;
}

message M2 {
    nested: S1;
}

struct S2 {
    wrapper: M2;
}

contract TestContract {
    data: S2;

    init() {
        self.data = S2{
            wrapper: M2{
                nested: S1{
                    payload: M1{}
                }
            }
        };
    }

    receive() {}
}