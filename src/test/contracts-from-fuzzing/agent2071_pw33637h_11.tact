struct InnerOpt {
    text: String?;
    num: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract ManyNulls {
    payload: OuterOpt;

    init() {
        self.payload = OuterOpt {
            inner: null,
        };
    }
}