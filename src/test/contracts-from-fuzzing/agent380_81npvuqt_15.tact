struct OptionalInner {
    s: String?;
    b: Bool;
}

struct Upper {
    x: Int;
    y: Bool?;
    nested: OptionalInner?;
}

contract NullableDeepFields {
    data: Upper;

    init() {
        self.data = Upper{
            x:1, y:null, nested:null
        };
    }
}