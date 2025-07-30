// mixture of contract param top level optionals and nested optionals in structs used as params
struct N1 {
    foo: Bool?;
    bar: Int;
}

struct N2 {
    nested: N1?;
    val: Int;
}

contract OptParams(
    a: Int?,
    b: Bool?,
    s: N2?,
) {
    receive() {
        // use
        let _ = self.a;
    }
}