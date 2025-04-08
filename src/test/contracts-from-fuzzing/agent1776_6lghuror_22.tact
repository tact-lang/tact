// Optional struct (present at start) with defaults and optionals inside
struct MixStruct {
    i: Int = 7;
    s: String?;
}

contract TestContract {
    m: MixStruct?;

    init() {
        self.m = MixStruct{i: 42, s: null};
    }

    receive() {
        let mv = self.m;
        if (mv != null) {
            let _ = mv!!.s;
        }
    }
}