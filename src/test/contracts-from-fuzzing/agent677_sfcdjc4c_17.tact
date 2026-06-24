struct Nested {
    val: Int?;
}

struct Container {
    inner: Nested?;
}

contract NestedOptionalsDefault {
    var: Container?;

    receive() {
        let _ = self.var;
    }
}