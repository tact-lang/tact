struct StructEscapist {
    a:Int;
    b:Int?;
    c:String;
}

contract PartialInitTest {
    s: StructEscapist;

    init() {
        self.s = StructEscapist{ a: 1, c: "ccc" };
    }
}