struct DeepOpt {
    leafVal: Int?;
}
struct HasDeepOpt {
    nested: DeepOpt;
}
contract NullDefaults {
    st: HasDeepOpt;
    init() {
        self.st = HasDeepOpt{
            nested: DeepOpt{} // no explicit leafVal
        };
    }
}
