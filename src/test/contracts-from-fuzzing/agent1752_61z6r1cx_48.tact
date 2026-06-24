struct X {
  a: Int;
  b: Bool;
}

contract AssignWholeThenNested {
    f: X;
    init() {
        self.f = X{a:5,b:true};
        self.f.a = 10;
    }
}