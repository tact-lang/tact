// 20 nested optional wrappers
struct D20{ v:Int?; }
struct D19{ d20:D20?; }
struct D18{ d19:D19?; }
struct D17{ d18:D18?; }
struct D16{ d17:D17?; }
struct D15{ d16:D16?; }
struct D14{ d15:D15?; }
struct D13{ d14:D14?; }
struct D12{ d13:D13?; }
struct D11{ d12:D12?; }
struct D10{ d11:D11?; }
struct D9{ d10:D10?; }
struct D8{ d9:D9?; }
struct D7{ d8:D8?; }
struct D6{ d7:D7?; }
struct D5{ d6:D6?; }
struct D4{ d5:D5?; }
struct D3{ d4:D4?; }
struct D2{ d3:D3?; }
struct D1{ d2:D2?; }

contract TwentyDeep {
  x:D1;
  init(){ self.x = D1{ d2:null }; }
}
