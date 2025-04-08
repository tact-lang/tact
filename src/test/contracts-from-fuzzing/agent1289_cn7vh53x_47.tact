// test Init assignment for struct with optionals using default values correctly
struct Mixed {
    a: Int;
    b: Int?;
    c: Bool?;
    d: String?;
}

contract DefaultAssignOptTest {
    rec: Mixed;

    init() {
        self.rec = Mixed{ a: 5, b: null, c: null, d: null };
    }
}
