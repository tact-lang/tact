// Contract with parameter list and complex nested struct as a param
struct Nested {
    i: Int;
    s: String?;
}

contract ParamsWithStruct(
    ns: Nested,
    optS: String?
) {
    receive() {
        let _ = self.ns.i + 1;
    }
}