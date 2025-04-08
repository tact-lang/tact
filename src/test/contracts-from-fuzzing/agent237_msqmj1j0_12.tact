struct IntsAndBools {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
}

contract CrossType {
    store: IntsAndBools;
    init() {
        self.store = IntsAndBools{a:5, b:true, c:10, d:false};
    }
}