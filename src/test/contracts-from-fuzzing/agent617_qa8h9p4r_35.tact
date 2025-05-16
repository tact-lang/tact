struct Container {
    m1: Empty1;
    m2: Empty2;
}

message(1) Empty1 {}
message(2) Empty2 {}

contract MultipleEmptyMsgs {
    data: Container;
    init() {
        self.data = Container{
            m1: Empty1{},
            m2: Empty2{}
        };
    }
}