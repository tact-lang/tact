message(1) EmptyMsg {}

struct Container {
    m: EmptyMsg;
    flag: Bool;
}

contract MessageInStruct {
    data: Container;
    init() {
        self.data = Container{
            m: EmptyMsg{},
            flag: true
        };
    }
}