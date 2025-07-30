struct InnerOptNull {
    val: Int?;
}

contract DefaultNulls {
    s: InnerOptNull;

    init() {
        self.s = InnerOptNull{ val: null };
    }
}