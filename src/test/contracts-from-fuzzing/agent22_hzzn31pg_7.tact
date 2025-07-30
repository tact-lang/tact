struct OptionalInner { inner: Int? }

contract EmbeddedOptional {
    innerStruct: OptionalInner;

    init() {
        self.innerStruct = OptionalInner{ inner: null };
    }
}