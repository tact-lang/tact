// Optional struct nested with parameter contract
struct S {
    inner: Int?;
}

contract MixedParams(
    s: S?,
    message: String?,
    flag: Bool,
) {
    receive() {
        let _ = self.flag;
    }
}