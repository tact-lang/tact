struct OptStructParam {
    tag: Int?;
    label: String?;
}

contract BothOptParamField(
    opt: OptStructParam?
) {
    receive() {
        let _ = self.opt;
    }
}
