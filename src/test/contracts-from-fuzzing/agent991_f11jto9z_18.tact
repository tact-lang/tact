struct InnerOpt {
    flag: Bool?;
    label: String?;
}

contract ParamNestedOpt(
    id: Int,
    info: InnerOpt,
) {
    receive() {
        let _ = self.id + 1;
    }
}