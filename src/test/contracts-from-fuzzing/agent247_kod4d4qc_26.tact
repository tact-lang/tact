struct Inner {
    a: Int;
    b: Bool;
}

contract MultipleStructs {
    first: Inner;
    second: Inner;
    init() {
        self.first = Inner{a:1,b:true};
        self.second = Inner{a:2,b:false};
    }
}