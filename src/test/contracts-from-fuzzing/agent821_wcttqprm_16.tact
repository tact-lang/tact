// test contract params with optional containing deeply nested struct
struct Innermost {
    value: Int;
}

struct OptionalWrap {
    inside: Innermost?;
}

contract ParamOptNested(
    info: OptionalWrap?,
    count: Int
) {
    receive() {
        let _ = self.info;
        let _ = self.count;
    }
}
