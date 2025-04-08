struct BoolFields {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
}

contract Test {
    data: BoolFields;

    init() {
        self.data = BoolFields{
            a:true, b:false, c:true,d:false
        };
    }
}