struct InnerStr {
 name: String;
}

struct WrapOptInner {
 inner: InnerStr?;
}

contract OptionalInnerStrTest {
    data: WrapOptInner;

    init() {
        self.data = WrapOptInner{ inner: null };
    }
}