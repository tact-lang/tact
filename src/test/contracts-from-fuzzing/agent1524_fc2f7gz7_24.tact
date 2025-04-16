// nested contract parameter structs with optionals
struct NA {
    x: Int?;
}
struct NB {
    a: NA?;
}

contract DeepParam(
    b: NB?,
) {
    receive() {
        if (self.b != null) {
            let _ = self.b!!.a;
        }
    }
}