struct NestedOpt {
    x: Int;
    y: Bool;
}

struct Wrapper {
    inner: NestedOpt?;
    label: String;
}

contract TestOptNested {
    w: Wrapper;

    init() {
       self.w = Wrapper{inner: null, label: "label"};
    }
}