struct NestedOpt {
    optionalInner: Int?;
}

contract NestedOptStruct {
    nestedOpt: NestedOpt;
    
    init() {
        self.nestedOpt = NestedOpt{ optionalInner: null };
    }
}