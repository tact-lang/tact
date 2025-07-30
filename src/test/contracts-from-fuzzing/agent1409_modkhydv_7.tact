struct HasBool {
    flag: Bool;
}
struct HasOptionalStruct {
    inner: HasBool?;
}

contract Test {
    os: HasOptionalStruct;
    init() {
        self.os = HasOptionalStruct{ inner: null };
    }
    receive() { let _ = self.os.inner; }
}