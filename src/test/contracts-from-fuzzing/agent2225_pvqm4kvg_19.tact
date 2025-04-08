struct X1 {f:Int}
struct X2 {x1:X1}
struct X3 {x2:X2}
struct X4 {x3:X3}
struct X5 {x4:X4}
struct X6 {x5:X5}
struct X7 {x6:X6}
struct X8 {x7:X7}
contract Leveled {
 data: X8;
 init() {
  self.data = X8{ x7:X7{ x6:X6{ x5:X5{ x4:X4{ x3:X3{ x2:X2{ x1:X1{ f:42 } } } } } } } };
 }
}