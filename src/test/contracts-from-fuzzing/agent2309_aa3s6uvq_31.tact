// nested optional with internal conversion
struct Final {
    val: Int;
}

struct Middle {
    f: Final?;
}

contract ConvOpt {
    st: Middle;
    init() {
        self.st = Middle{ f: null };
        let cell = self.st.toCell();
        let back = Middle.fromCell(cell);
    }
}