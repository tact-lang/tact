struct NestedInits {
    first: Inner1;
    second: Inner2;
}

struct Inner1 {
    x: Int = 5;
}

struct Inner2 {
    y: Bool = true;
    s: String = "init";
}

contract NestedInitsContract {
    data: NestedInits;

    init() {
        self.data = NestedInits{
            first: Inner1{ x: 10 },
            second: Inner2{ y: false, s: "changed" }
        };
    }
}