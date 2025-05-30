struct MustInit {
    q: Int;
}

contract TestContract {
    nestedOpt: MustInit?;

    init() {
        self.nestedOpt = null;
    }
}