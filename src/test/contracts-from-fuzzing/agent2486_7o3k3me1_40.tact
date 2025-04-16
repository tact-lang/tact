struct OptionalsNest {
    v1: Int?;
    v2: Bool?;
    v3: String?;
}

struct MoreNest {
    inner: OptionalsNest;
    count: Int;
}

contract DeepOpts {
    val: MoreNest = MoreNest{
        inner: OptionalsNest{
            v1:null,
            v2:null,
            v3:null
        },
        count:42
    };
}