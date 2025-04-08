struct Embed1 { a: Int }
struct Embed2 { b: Embed1 }
struct Embed3 { c: Embed2 }
struct Embed4 { d: Embed3 }

contract DeepEmbedding {
    root: Embed4;

    init() {
        self.root = Embed4{
            d: Embed3{
                c: Embed2{
                    b: Embed1{a: 5}
                }
            }
        };
    }
}