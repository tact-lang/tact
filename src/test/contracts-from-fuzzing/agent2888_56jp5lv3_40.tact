// optional within optional in param style contract
struct Inner {
    x: Int?;
}

contract ParamOptOpt(
    inn: Inner?,
    y: Int?,
) {
    receive() {
        let _ = self.y;
    }
}