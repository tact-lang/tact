struct DeepNested {
    inner: OptionalInner;
}

struct OptionalInner {
    maybeVal: Int?;
}

contract OptDeep {
    val: DeepNested;
    
    init() {
        self.val = DeepNested{ inner: OptionalInner{ maybeVal: null } };
    }
}