// test optional of struct inside param
struct OptionalParam {
    a: Int;
}

contract TestOptionalParam(
    data: OptionalParam?,
    ready: Bool
) {
    receive() {
        let _ = self.data;
        let _ = self.ready;
    }
}
