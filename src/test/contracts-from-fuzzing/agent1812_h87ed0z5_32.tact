// Now test very large struct with multiple nested layers
struct Layer4 { val: Int; }
struct Layer3 { val: Layer4; }
struct Layer2 { val: Layer3; }
struct Layer1 { val: Layer2; }

contract MassiveNested {
  data: Layer1;

  init() {
    self.data = Layer1{
      val: Layer2{
        val: Layer3{
          val: Layer4{
            val: 123
          }
        }
      }
    };
  }
}