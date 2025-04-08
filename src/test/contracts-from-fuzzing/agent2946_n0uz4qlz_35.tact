struct OuterDefaultOpt {
    opt: Int?;
}

contract DefaultNestedOpt {
    val: OuterDefaultOpt;
    init() {
        self.val = OuterDefaultOpt{ opt: null };
    }
}