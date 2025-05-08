// Large contract parameters with diverse fields
contract DiverseParams(
    ai: Int,
    ab: Bool,
    as_: String,
    an: Int?,
    ab_opt: Bool?,
    astr_opt: String?
) {
    receive() {
        // dummy reference to force compile
        let _ = self.ai + 1;
    }
}