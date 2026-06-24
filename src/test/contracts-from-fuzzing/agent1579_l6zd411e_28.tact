struct XOpt {
    f: Int?;
}

struct XYOpt {
    first: XOpt;
    second: XOpt?;
}

contract ComboOpt {
    data: XYOpt;
    init() {
        self.data = XYOpt{
            first:XOpt{f:null},
            second: null
        };
    }
    receive() {
        self.data.second = XOpt{f: 3};
    }
}