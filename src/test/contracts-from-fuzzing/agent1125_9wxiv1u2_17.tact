struct MultiLayer1 { f: Int }
struct MultiLayer2 { f: MultiLayer1 }
struct MultiLayer3 { f: MultiLayer2 }
struct MultiLayer4 { f: MultiLayer3 }
struct MultiLayer5 { f: MultiLayer4 }

contract NestFive {
  x: MultiLayer5;
  init() {
    self.x = MultiLayer5{ f: MultiLayer4{ f: MultiLayer3{ f: MultiLayer2{ f: MultiLayer1{ f: 42 } } } } };
  }
}