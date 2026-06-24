struct Inner1 { f1: Int; }
struct Inner2 { f2: Bool; }
struct Inner3 { f3: String; }

contract TestContract {
    v1: Inner1;
    v2: Inner2;
    v3: Inner3;

    init() {
        self.v1 = Inner1{f1:777};
        self.v2 = Inner2{f2:true};
        self.v3 = Inner3{f3:"hello"};
    }
}