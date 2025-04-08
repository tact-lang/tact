struct ContainsString {
    s: String;
}
contract NestedStringOpt {
    s: ContainsString?;
    init() {
        self.s = ContainsString{ s:"hi" };
    }
}