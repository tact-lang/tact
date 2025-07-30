struct Sub {
    s: String;
    ok: Bool;
}

struct Container {
    label: String;
    sub: Sub;
}

contract NestedStringStructs {
    data: Container;

    init() {
        self.data = Container{
            label: "outer",
            sub: Sub{ s: "inner", ok: true }
        };
    }
}