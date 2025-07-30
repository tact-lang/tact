struct LayersA { a: Int; b: Bool }
struct LayersB { s: LayersA; c: String }
struct LayersC { s: LayersB; d: Address }

contract Layered {
  val: LayersC;

  init() {
    self.val = LayersC{
      s: LayersB{
        s: LayersA{ a:1, b:true },
        c: "data"
      },
      d: myAddress()
    };
  }
}