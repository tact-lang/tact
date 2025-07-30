struct Small {
    a: Int;
    b: Bool;
}

contract TestContract {
    s: Small = Small{a:1, b:true};

    init() {
        self.s = Small{a:2, b:false};
    }
}