struct Info {
    a: Int;
    b: Bool;
    c: String?;
}

contract TestManyFields {
    data: Info;

    init() {
        self.data = Info{
            a: 123,
            b: true,
            c: null
        };
    }

    receive() {
        let _ = self.data;
    }
}