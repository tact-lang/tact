message EmptyMessage {}

struct Wrapper {
    payload: EmptyMessage;
}

contract TestContract {
    field: Wrapper;

    init() {
        self.field = Wrapper{payload: EmptyMessage{}};
    }

    receive() {}
}