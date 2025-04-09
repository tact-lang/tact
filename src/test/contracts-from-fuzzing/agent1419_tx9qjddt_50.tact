struct BoolIntString {
    a: Bool;
    b: Int;
    c: String;
}

contract OptionalStructWrap {
    val: BoolIntString?;

    init() {
        self.val = BoolIntString{ a:true, b:7, c:"hi" };
    }
}