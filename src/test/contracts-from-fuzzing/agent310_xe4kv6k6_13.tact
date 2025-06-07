struct InnerOpt {
    f: Int?;
}

contract InnerOptionalAssignedNonNull {
    data: InnerOpt;

    init() {
        self.data = InnerOpt{
            f: 999
        };
    }
}