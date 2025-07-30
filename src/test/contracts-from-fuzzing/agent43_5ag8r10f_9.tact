struct Inner1 {
    x: Int;
    y: Bool;
}

struct Inner2 {
    s: String;
    e: Address;
}

struct Combine {
    a: Inner1;
    b: Inner2;
}

contract NestedCombine {
    z: Combine;

    init() {
        self.z = Combine{
            a: Inner1{ x: 1, y: true },
            b: Inner2{ s: "ok", e: myAddress() }
        };
    }
}