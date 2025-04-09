struct OptionalDeep {
    inner: Inner?;
}

struct Inner {
    deeper: Deeper?;
}

struct Deeper {
    deepest: Int?;
}

contract TestContract(deep: OptionalDeep) {
    receive() {
        let _ = self.deep;
    }
}