struct OptionalsNested {
    opt1: Int?;
    inner: InnerOpt?;
}

struct InnerOpt {
    opt2: String?;
    deeper: DeeperOpt?;
}

struct DeeperOpt {
    flag: Bool?;
}

contract CrazyNestedOptionals {
    data: OptionalsNested;
    init() {
        self.data = OptionalsNested{
            opt1: null,
            inner: null
        };
    }
}