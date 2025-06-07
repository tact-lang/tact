struct BoolFields {
    a: Bool;
    b: Bool;
    c: Bool;
}

contract BoolStorage {
    data: BoolFields;

    init() {
        self.data = BoolFields { a:true, b:false, c:true };
    }
}