struct Bundle {
    x: Int;
    y: Bool;
}

contract ParamComposite(
    bundle: Bundle,
) {
    receive() {
        let _ = self.bundle.x;
    }
}