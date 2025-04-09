struct Inner {
    a: Int;
}

struct Wrapper {
    x: Int?;
    y: Inner;
}

contract FieldOrderContract {
    data: Wrapper;
    init() {
        self.data = Wrapper{
            x: null,
            y: Inner{ a: 777 },
        };
    }
}