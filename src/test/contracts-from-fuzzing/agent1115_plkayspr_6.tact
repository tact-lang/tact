struct InnerOpt {
    optStr: String?; 
}

struct Wrap {
    nestedOpt: InnerOpt?; 
}

contract NestedOptStruct {
    item: Wrap;
    init() {
        self.item = Wrap { nestedOpt: InnerOpt { optStr: null } };
    }
}
