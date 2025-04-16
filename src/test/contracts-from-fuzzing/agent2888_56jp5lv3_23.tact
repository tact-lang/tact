// nested optional chain struct in contract param style
contract ParamsStyle(
    id: Int,
    label: String?,
    number: Int?,
    toggle: Bool?,
) {
    receive() {
        // dummy usage
        let _ = self.id;
    }
}