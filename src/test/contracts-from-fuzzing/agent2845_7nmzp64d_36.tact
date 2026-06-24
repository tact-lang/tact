struct DeepNested {
    x: Int = 1;
    y: Bool?;
}

contract DefaultsNestedOpt {
    val: DeepNested;

    init() {
        self.val = DeepNested{ y: null };
    }
}