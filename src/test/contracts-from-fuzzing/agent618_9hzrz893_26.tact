struct SomePair {
    a: Int;
    b: Bool;
}

struct NestedWrap {
    pair: SomePair;
    c: Int;
}

contract NestedStructWrap {
    foo: SomePair;
    bar: NestedWrap;

    init() {
        self.foo = SomePair{a:1,b:true};
        self.bar = NestedWrap{pair: SomePair{a:2,b:false}, c:3};
    }
}