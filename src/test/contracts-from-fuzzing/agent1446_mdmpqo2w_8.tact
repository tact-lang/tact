struct Inner1 { x: Int }
struct Inner2 { y: Inner1 }
struct Inner3 { z: Inner2 }

contract Test {
    deep: Inner3;

    init() {
        self.deep = Inner3{
            z: Inner2{
                y: Inner1{
                    x: 123
                }
            }
        };
    }
}
