struct X1 { a: Int; }
struct X2 { x: X1; }
struct X3 { x: X2; }
struct X4 { x: X3; }
struct X5 { x: X4; }
struct X6 { x: X5; }
struct X7 { x: X6; }
struct X8 { x: X7; }
struct X9 { x: X8; }
struct X10 { x: X9; }
struct X11 { x: X10; }
struct X12 { x: X11; }
struct X13 { x: X12; }
struct X14 { x: X13; }
struct X15 { x: X14; }
struct X16 { x: X15; }

contract TooDeep {
  data: X16;

  init() {
    self.data = X16{ x:X15{ x:X14{ x:X13{ x:X12{ x:X11{ x:X10{ x:X9{ x:X8{ x:X7{ x:X6{ x:X5{ x:X4{ x:X3{ x:X2{ x:X1{ a:123 }}}}}}}}}}}}}}}};
  }
}