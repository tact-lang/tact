struct S {
  a: Int?;
  b: String?;
}

contract NestedNulls {
    x: S;
    y: S;

    init() {
        self.x = S{a:null, b:null};
        self.y = S{a:null, b:null};
    }
}