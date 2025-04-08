struct InnerOpt {
    info: String?;
    flag: Bool?;
}

contract TestContract(
    innerOpt: InnerOpt,
    num: Int
) {
    receive() {
        // dummy usage
        let _ = self.innerOpt;
    }
}