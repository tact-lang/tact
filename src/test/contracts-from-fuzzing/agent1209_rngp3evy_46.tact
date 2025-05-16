struct WithOpt {
    o: Int?;
}
contract WrapOptField {
    val: WithOpt;
    init() {
        self.val = WithOpt{o: null};
    }
}