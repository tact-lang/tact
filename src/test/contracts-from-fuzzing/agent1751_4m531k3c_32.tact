struct Inner {
    data: Int;
}

trait TraitWithComposite {
    nested: Inner;
}

contract CompositeOverride with TraitWithComposite {
    nested: Inner;

    init() {
        self.nested = Inner{ data: 99 };
    }

    receive() {}
}