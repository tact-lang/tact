message(0x1111) EmptyMsg {}

struct Wrapper {
    m: EmptyMsg;
}

contract TestContract {
    data: Wrapper;
    init() {
        self.data = Wrapper{
            m: EmptyMsg{}
        };
    }
}