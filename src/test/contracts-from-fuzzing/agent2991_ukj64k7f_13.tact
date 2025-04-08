struct IntsAndStrings {
    ia: Int;
    ib: Int;
    ic: Int;
    sa: String;
    sb: String;
    sc: String;
}

contract Test {
    f: IntsAndStrings;

    init() {
        self.f = IntsAndStrings{
            ia:10, ib:20, ic:30,
            sa:"x", sb:"y", sc:"z"
        };
    }
}