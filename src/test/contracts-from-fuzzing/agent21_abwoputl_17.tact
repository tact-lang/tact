struct InnerOptNull {
    data: Int?;
}

struct MidOpt {
    inner: InnerOptNull?;
}

contract DeepOptNull {
    val: MidOpt;

    init() {
        self.val = MidOpt{ inner: null };
    }
}
