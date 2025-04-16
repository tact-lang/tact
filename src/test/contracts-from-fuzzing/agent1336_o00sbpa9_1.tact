struct InnerNestedOpt {
    b: Bool?;
    s: String?;
}

struct OuterNestedOpt {
    n: Int?;
    inner: InnerNestedOpt?;
}

contract DeepOptionalFields {
    data: OuterNestedOpt;
    
    init() {
        self.data = OuterNestedOpt{
            n: null,
            inner: null
        };
    }

    receive() {
        let _ = self.data;
    }
}