struct Inner {
    a: Int;
    b: String;
    c: Bool;
    d: Cell;
    e: Address;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
    inner3: Inner;
    inner4: Inner;
}

contract MultipleNestedStructs {
    data: Outer;

    init() {
        self.data = Outer{
            inner1: Inner{a:1,b:"one",c:true,d:emptyCell(),e:myAddress()},
            inner2: Inner{a:2,b:"two",c:false,d:emptyCell(),e:myAddress()},
            inner3: Inner{a:3,b:"three",c:true,d:emptyCell(),e:myAddress()},
            inner4: Inner{a:4,b:"four",c:false,d:emptyCell(),e:myAddress()},
        };
    }
}
