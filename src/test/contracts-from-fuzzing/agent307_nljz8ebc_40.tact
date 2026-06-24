struct Param {
    a: Int;
    b: Bool;
    c: String;
}

contract StructDefaults {
    p: Param;

    init() {
        self.p = Param { a:1, b:true, c:"test" };
    }
}