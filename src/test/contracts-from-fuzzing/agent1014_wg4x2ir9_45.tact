// Test nested message types as fields

message M1 {}
message M2 { m1: M1 }

contract Test {
  field: M2 = M2{ m1: M1{} };
}
