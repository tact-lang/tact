struct Bools {
    a: Bool;
    b: Bool;
    c: Bool;
}

contract BoolFields {
    data: Bools;
    init() {
        self.data = Bools{ a:true, b:false, c:true };
    }
}