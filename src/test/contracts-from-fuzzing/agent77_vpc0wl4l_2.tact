struct Inner {
    d: Int?; 
    e: Bool; 
}

struct Nested {
    a: Int; 
    b: Bool?; 
    c: Inner;
}

contract OptionalDeep {
    val: Nested;

    init() {
        self.val = Nested{a: 5, b: null, c: Inner{d: null, e: false}};
    }

    receive() {
        self.val = Nested{a: 6, b: true, c: Inner{d: 1, e: true}};
    }
}
