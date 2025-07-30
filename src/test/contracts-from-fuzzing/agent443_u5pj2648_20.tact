struct Sub0 { foo: Int; }
struct Sub1 { bar: String; }
struct Sub2 { baz: Bool; }

struct Mega {
    sub0: Sub0;
    sub1: Sub1;
    sub2: Sub2;
}

contract ComposeTest {
    data: Mega;

    init() {
        self.data = Mega{
          sub0: Sub0{foo:1},
          sub1: Sub1{bar:"hello"},
          sub2: Sub2{baz:true}
        };
    }
}