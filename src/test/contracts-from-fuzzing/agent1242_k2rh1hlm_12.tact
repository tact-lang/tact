struct DeepStructA { x: DeepStructB; }
struct DeepStructB { x: DeepStructC; }
struct DeepStructC { x: DeepStructD; }
struct DeepStructD { x: Int; }

contract TestContract {
  v: DeepStructA;

  init() {
    self.v = DeepStructA{
      x: DeepStructB{
        x: DeepStructC{
          x: DeepStructD{ x: 7 }
        }
      }
    };
  }
}