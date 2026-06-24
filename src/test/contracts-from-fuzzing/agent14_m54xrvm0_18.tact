message(1) M1 { val: Int }
message(2) M2 { flag: Bool }
message(3) M3 { text: String }

struct Holder {
    m1: M1?;
    m2: M2?;
    m3: M3?;
}

contract Test18 {
    stored: Holder;

    init() {
        self.stored = Holder{ m1: null, m2: null, m3: null };
    }
}
