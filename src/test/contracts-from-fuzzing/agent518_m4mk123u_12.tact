struct DataA {
    val: Int;
    note: String;
}

struct DataB {
    ok: Bool;
    flag: Bool?;
}

contract MultiOptStructs {
    a: DataA?;
    b: DataB?;

    init() {
        self.a = null;
        self.b = null;
    }
}