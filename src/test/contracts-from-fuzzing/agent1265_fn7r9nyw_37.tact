struct Packed {
    a: Int;
    b: Bool;
    c: String;
}

contract PackedFields {
    data: Packed;

    init() {
        self.data = Packed{ a:5, b:true, c:"hi" };
    }
}