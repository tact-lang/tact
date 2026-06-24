struct Inner1 { a: Int }
struct Inner2 { b: Bool }
struct Inner3 { c: String }

contract ManyStructFields {
    f1: Inner1;
    f2: Inner2;
    f3: Inner3;

    init() {
        self.f1 = Inner1{ a:1 };
        self.f2 = Inner2{ b:false };
        self.f3 = Inner3{ c:"x" };
    }
}
