message(1) M1 { foo: Int; }
message(2) M2 { bar: Int; }

struct Complex {
  a: M1?;
  b: M2;
}

contract ComboOptReqVal {
  field: Complex = Complex{a:M1{foo:7}, b:M2{bar:42}};
}