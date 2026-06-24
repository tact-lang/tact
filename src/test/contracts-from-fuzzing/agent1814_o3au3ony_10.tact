struct Inner {
    flag: Bool;
    label: String;
}

contract DirectNested {
    inside: Inner;
    count: Int;

    init() {
        self.inside = Inner{flag: true, label: "yes"};
        self.count = 5;
    }
}
