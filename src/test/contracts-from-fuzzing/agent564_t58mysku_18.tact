// Struct with optional string and inner struct
struct InnerS {
    val: Int;
}

struct OuterS {
    text: String?;
    inner: InnerS;
}

contract OptString {
    data: OuterS;
    init() {
        self.data = OuterS { text: null, inner: InnerS{ val: 10 } };
    }
    receive() {
        if (self.data.text == null) {
            self.data.inner.val += 2;
        }
    }
}