struct Embed {
    f1: Int;
    f2: Bool;
}

contract OptionalStruct {
    inner: Embed?;
    init() {
        self.inner = Embed{f1:5, f2:true};
    }
}