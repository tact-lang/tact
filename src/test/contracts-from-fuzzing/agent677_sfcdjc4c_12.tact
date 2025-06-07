struct Small {
    n: Int as uint8;
    flag: Bool?;
    txt: String?;
}

contract MixedComplexParams(
    id: Int as uint32,
    data: Small?,
    done: Bool,
    label: String?,
) {
    receive() {
        let _ = self.id + 1;
    }
}