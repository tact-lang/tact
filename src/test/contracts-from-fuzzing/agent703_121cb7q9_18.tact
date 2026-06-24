struct Inner {
    value: Int;
}

struct Data {
    data: Inner;
}

contract TestContract {
    data: Data;

    init() {
        self.data = Data{
            data: Inner{ value: 123 }
        };
    }
}