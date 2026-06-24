// Eleven nested optional wrappers
struct D11{ v:Int?; }
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

contract ElevenDeep {
  x:D1;
  init(){ self.x = D1{ d2:null }; }
}
