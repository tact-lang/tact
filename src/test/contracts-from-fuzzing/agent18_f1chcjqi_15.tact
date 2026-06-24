struct Containing {
    val: Int;
    opt: InnerOpt?;
}

struct InnerOpt {
    str: String?;
    flag: Bool?;
}

contract OptInOpt {
    data: Containing;
    init() {
        self.data = Containing{
            val: 5,
            opt: null
        };
    }
}