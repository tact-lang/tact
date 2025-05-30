struct Reorder {
    a: Int;
    b: Int?;
    c: Bool;
}

contract Test {
    data: Reorder;

    init() {
        self.data = Reorder{ a:1, b:null, c:true };
    }
}