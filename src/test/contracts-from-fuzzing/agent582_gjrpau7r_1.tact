struct DeepNested {
    inner1: Inner1;
}

struct Inner1 {
    inner2: Inner2;
}

struct Inner2 {
    inner3: Inner3;
}

struct Inner3 {
    finalVal: Int;
}

contract TestContract {
    val: DeepNested;
    init() {
        self.val = DeepNested{inner1: Inner1{inner2: Inner2{inner3: Inner3{finalVal: 42}}}};
    }
}