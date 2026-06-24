struct BigNested {
    foo: NestedA;
    bar: NestedB;
}

struct NestedA {
    a: Int;
    b: Bool;
    c: String;
}

struct NestedB {
    d: Int;
    e: Bool;
    f: String;
    g: NestedInner;
}

struct NestedInner{
    h: Int;
    i: Bool;
}

contract TestContract {
    data: BigNested;

    init() {
        self.data = BigNested{
            foo: NestedA{a:1,b:true,c:"x"},
            bar: NestedB{d:2,e:false,f:"y",g:NestedInner{h:3,i:true}}
        };
    }
}