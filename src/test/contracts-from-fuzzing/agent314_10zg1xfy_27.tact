// optional struct that contains nested optional struct
struct InnerMostOpt {
    val: Int?;
}

struct MidOpt {
    inner: InnerMostOpt?;
    label: String;
}

contract OptInOptInOpt {
    field: MidOpt?;
    init() {
        self.field = null;
    }
}