// Try optional Builder in struct persistent storage
// (Should be rejected, because Builder is not allowed as persistent field type)
struct BuilderWrap {
    b: Builder?;
}

contract TestContract {
    bw: BuilderWrap;
    init() {
        self.bw = BuilderWrap {
            b: null
        };
    }
}