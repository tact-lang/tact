struct OptionalNestedDeep {
    nested: InnerOpt?;
}

struct InnerOpt {
    deep: Deeper?;
}

struct Deeper {
    x: Int;
}

contract TestContract {
    data: OptionalNestedDeep = OptionalNestedDeep{ nested: null };

    init() {
        self.data = OptionalNestedDeep{ nested: InnerOpt{ deep: Deeper{ x: 42 } } };
    }
}