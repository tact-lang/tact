struct AOpt {
    a: Int?;
    b: Bool?;
}

struct BOpt {
    inner: AOpt?;
    s: String?;
}

contract LotsOptionNested {
    val: BOpt;

    init() {
        self.val = BOpt{
            inner: null,
            s: null
        };
    }
}