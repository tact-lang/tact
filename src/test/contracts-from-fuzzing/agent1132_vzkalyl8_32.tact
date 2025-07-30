struct Sub {
    a: Int;
    b: Bool?;
    c: String;
}

contract ComposeInit {
    s: Sub;
    
    init() {
        self.s = Sub{a: 1, b: null, c: ""};
    }
}