struct OptDeep {
    l: Int?;
}
struct DeepOpt {
    nest: OptDeep?;
}
contract Test43 {
    d: DeepOpt;

    init() {
        self.d = DeepOpt{ nest: null };
    }
}
