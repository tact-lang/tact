struct Inner1 {
    val: Int;
}

struct Inner2 {
    v2: Int;
    in1: Inner1;
}

struct Inner3 {
    in2: Inner2;
    also: Bool;
}

contract ChainNestedStructs {
    st: Inner3;

    init() {
        self.st = Inner3{ in2: Inner2{ v2:9, in1: Inner1{ val:7 } }, also:false };
    }
}