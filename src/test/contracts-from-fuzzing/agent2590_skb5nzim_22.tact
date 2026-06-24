struct DeepChainOptional {
 a: Int?;
 b: Layer2?;
}

struct Layer2 {
 c: Int?;
 d: Layer3?;
}

struct Layer3 {
 e: Int?;
 f: Layer4?;
}

struct Layer4 {
 g: Int?;
}

contract ChainOptionalContract {
 data: DeepChainOptional;
 init() {
  self.data = DeepChainOptional{
    a:null,
    b:null
  };
 }
}