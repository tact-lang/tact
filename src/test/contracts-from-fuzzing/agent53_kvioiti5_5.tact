struct OptInNested {
    a: Int;
    b: Int?;
    c: Bool;
}

contract OptionalStructField {
    data: OptInNested?;

    init() {
        self.data = OptInNested{ a:1, b:null, c:true };
    }
}