struct DeeplyNested {
    next: Inner;
}

struct Inner {
    val: Int;
}

contract DeepSingle {
    item: DeeplyNested;
    init() {
        self.item = DeeplyNested{ next: Inner{ val: 1 } };
    }
}