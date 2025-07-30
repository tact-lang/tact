contract DeepOptionalNested {
    data: DataWrapper;

    init() {
        self.data = DataWrapper{
            inner: InnerWrapper{
                payload: Payload{
                    a: 1,
                    b: null,
                    c: "test"
                },
                flag: true
            },
            marker: null
        };
    }
}

struct DataWrapper {
    inner: InnerWrapper;
    marker: String?;
}

struct InnerWrapper {
    payload: Payload;
    flag: Bool;
}

struct Payload {
    a: Int;
    b: Int?;
    c: String;
}
