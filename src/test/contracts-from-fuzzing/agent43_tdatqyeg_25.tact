struct LayerA { a: Int }
struct LayerB { b: LayerA }
struct LayerC { c: LayerB }
struct LayerD { d: LayerC }
struct LayerE { e: LayerD }

contract DeepChain {
  f: LayerE;

  init() {
    self.f = LayerE{
      e: LayerD{
        d: LayerC{
          c: LayerB{
            b: LayerA{ a: 42 }
          }
        }
      }
    };
  }
}