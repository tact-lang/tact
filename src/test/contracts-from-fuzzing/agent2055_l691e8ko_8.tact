struct Str1 {
  a: Int;  b: Bool;
}

struct Str2 {
  c: String; d: Int?;
}

contract CrossNestedFields {
    f1: Str1;
    f2: Str2;

    init() {
        self.f1 = Str1{a:1, b:true};
        self.f2 = Str2{c:"a", d:null};
    }
}
