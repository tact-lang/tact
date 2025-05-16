struct NestedOption {
    innerValue: Int?;
}

contract OptStructOptField {
    myVal: NestedOption?;

    init() {
        self.myVal = NestedOption{
            innerValue: 42
        };
    }
}