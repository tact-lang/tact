struct DeepAndWide {
    nested1: Inner1;
    nested2: Inner2;
}

struct Inner1 {
    x: Int;
    y: Bool?;
    z: String?;
}

struct Inner2 {
    a: Int;
    b: Bool;
    c: String;
}

contract DeepAndWideContract {
    data: DeepAndWide;

    init() {
        self.data = DeepAndWide{
            nested1: Inner1{x: 10, y: null, z: "abc"},
            nested2: Inner2{a: 5, b: true, c: "xyz"}
        };
    }
}