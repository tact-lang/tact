struct NestedPoint {
    x: Int;
    y: Int;
}

struct DeepStruct {
    inner: NestedPoint;
    optionalInner: NestedPoint?;
    flag: Bool;
    text: String;
}

contract StorageDeepTest {
    data: DeepStruct;

    init() {
        self.data = DeepStruct{
            inner: NestedPoint{ x: 1, y: 2 },
            optionalInner: null,
            flag: true,
            text: "test",
        };
    }
}