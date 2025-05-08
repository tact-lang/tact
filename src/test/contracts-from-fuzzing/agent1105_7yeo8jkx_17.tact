struct InnerMost { x: Int; }
struct Inner2 { y: InnerMost; }
struct Inner1 { z: Inner2; }

contract SuperDeepNested {
    val: Inner1;
    init() {
        self.val = Inner1{
            z: Inner2{
                y: InnerMost{ x: 42 }
            }
        };
    }
}