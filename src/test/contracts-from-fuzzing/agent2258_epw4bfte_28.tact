struct SOpt {
    a: Int?;
    b: Bool?;
}

contract ParamsWithStruct(
    s: SOpt,
) {
    receive() {
        let _ = self.s.a;
    }
}