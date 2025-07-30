struct SubOpt {
    inner: Int?;
}

contract NestedOptionField {
    top: SubOpt?;

    init() {
        self.top = SubOpt{ inner:null };
    }
}
