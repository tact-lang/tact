struct HasString {
    txt: String;
}

struct WrapperOpt {
    inner: HasString?;
}

contract WrapperOptContainer {
    data: WrapperOpt = WrapperOpt{ inner: null };

    init() {
        self.data = WrapperOpt{ inner: HasString{ txt: "yo" } };
    }
}