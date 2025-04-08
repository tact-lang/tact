struct SVal {
    i: Int;
    b: Bool;
}

struct SHolder {
    data: SVal?;
}

contract OptionalStructField {
    holder: SHolder;

    init() {
        self.holder = SHolder{ data: null };
    }
}