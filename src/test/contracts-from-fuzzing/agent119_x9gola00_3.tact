struct DeepNested {
    s: String;
    flag: Bool;
}

struct Middle {
    number: Int;
    inner: DeepNested;
}

struct Outer {
    mid: Middle;
    val: Int;
}

contract TestContract {
    nestedStruct: Outer;

    init() {
        self.nestedStruct = Outer{
            mid: Middle{number: 7, inner: DeepNested{s: "hi", flag: false}},
            val: 99
        };
    }

    receive() {
        let n = self.nestedStruct;
    }
}