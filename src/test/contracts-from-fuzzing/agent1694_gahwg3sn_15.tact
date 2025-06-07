struct Inner1 { x: Int }
struct Inner2 { y: Bool; inner1: Inner1 }
struct Inner3 { text: String; inner2: Inner2 }

contract StructComposition {
    c: Inner3;

    init() {
        self.c = Inner3{
            text: "hi",
            inner2: Inner2{
                y: true,
                inner1: Inner1{
                    x: 999
                }
            }
        };
    }
}