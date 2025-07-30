// Compose struct chain containing many optionals
struct Base {
    x: Int; 
    y: Int?;
}
struct Mid1 {
    b: Base?;
}
struct Mid2 {
    c: Mid1?;
}
struct Top {
    d: Mid2?;
}

contract OptionalChain {
    state: Top;

    init() {
        self.state = Top{d:null};
    }
}