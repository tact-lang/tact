struct Inner1 {
    foo: Int;
    bar: Bool;
}
struct Inner2 {
    foo: Int?;
    bar: Bool?;
}
struct Outer {
    inner1: Inner1;
    inner2: Inner2;
    num: Int;
}

contract TestContract {
    info: Outer;

    init() {
        self.info = Outer{
            inner1: Inner1{foo:1, bar:true},
            inner2: Inner2{foo:null, bar:null},
            num: 100
        };
    }
}