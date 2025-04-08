struct Inner1 { a: Int }
struct Inner2 { b: Int }

struct Combine {
    one: Inner1;
    two: Inner2?;
    optInt: Int?;
    str: String;
}

contract StructMix {
    val: Combine;

    init() {
        self.val = Combine{
            one: Inner1{a:1},
            two: null,
            optInt: null,
            str: "hi"
        };
    }
}