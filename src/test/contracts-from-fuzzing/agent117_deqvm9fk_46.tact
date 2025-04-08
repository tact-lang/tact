struct Wrapper {
    p: Bool?;
    s: String?;
}

contract SomeWrap {
    wrapField: Wrapper;

    init() {
        self.wrapField = Wrapper{p:true,s:"foo"};
    }
}
