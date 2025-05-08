struct DefaultOptStruct {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract DefaultOptStructC {
    s: DefaultOptStruct = DefaultOptStruct{};
    receive() {
        let _ = self.s.b;
    }
}