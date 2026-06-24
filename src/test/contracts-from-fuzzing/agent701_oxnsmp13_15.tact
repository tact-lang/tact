struct Inner1 {
    val: Int;
}
struct Inner2 {
    val: String;
}

struct OuterBoth {
    one: Inner1;
    two: Inner2;
}

contract StructMix {
    data: OuterBoth;

    init() {
        self.data = OuterBoth{
            one: Inner1{ val: 4 },
            two: Inner2{ val: "str" },
        };
    }
}