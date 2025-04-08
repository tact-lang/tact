struct Inner1 { a: Int; b: String; }
struct Inner2 { c: Bool; d: Int?; }

struct Container {
    left: Inner1;
    right: Inner2;
    flag: Bool;
    text: String?;
}

contract TestContract {
    complex: Container;

    init() {
        self.complex = Container{
            left: Inner1{a:1, b:"abc"},
            right: Inner2{c:true,d:null},
            flag: false,
            text: null
        };
    }
}