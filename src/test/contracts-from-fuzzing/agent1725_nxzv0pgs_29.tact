struct DeepRef {
    a: Int;
    b: SubRef;
}

struct SubRef {
    c: Int;
    d: SubSubRef;
}

struct SubSubRef {
    e: Int;
    f: String;
}

contract TestContract {
    val: DeepRef;

    init() {
        self.val = DeepRef{
            a: 1,
            b: SubRef{
                c: 2,
                d: SubSubRef{
                    e: 3,
                    f: "hello"
                }
            }
        };
    }
}