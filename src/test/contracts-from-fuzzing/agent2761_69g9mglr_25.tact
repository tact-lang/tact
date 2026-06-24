struct NestedOpt {
    s: Int?;
    t: String?;
}

contract OptTopLevel {
    nest: NestedOpt?;
    init() {
        self.nest = null;
    }
}
