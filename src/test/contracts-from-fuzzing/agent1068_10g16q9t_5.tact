struct Sub {
    detail: String;
    count: Int;
}

struct Top {
    id: Int;
    info: String?;
    inner: Sub;
}

contract TestContract {
    data: Top;

    init() {
        self.data = Top{
            id: 7,
            info: null,
            inner: Sub{
                detail: "deeper",
                count: 99,
            },
        };
    }

    receive() {
        self.data = self.data;
    }
}
