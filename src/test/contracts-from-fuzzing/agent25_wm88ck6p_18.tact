struct NestedStrOpt {
    s: String?;
}

contract TestContract {
    f: NestedStrOpt;
    
    init() {
        self.f = NestedStrOpt{ s: "hi" };
    }
}