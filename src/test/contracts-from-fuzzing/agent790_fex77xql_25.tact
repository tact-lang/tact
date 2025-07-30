struct Wrapper {
    a: Int?;
    b: Bool;
}

contract OptionalFirst {
    w: Wrapper;

    init() {
        self.w = Wrapper{a:null, b:true};
    }
}