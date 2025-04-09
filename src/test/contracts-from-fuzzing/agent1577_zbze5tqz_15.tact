message(11) M1 {
    x: Int;
}

message(22) M2 {
    inner: M1;
    flag: Bool;
}

struct Container {
    outer: M2;
}

contract TestContract {
    data: Container;
    init() {
        self.data = Container{
            outer: M2{
                inner: M1{x: 42},
                flag: true
            }
        };
    }
}