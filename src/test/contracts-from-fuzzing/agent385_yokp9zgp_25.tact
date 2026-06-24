struct Embed1 { x: Int }
struct Embed2 { e: Embed1 }
struct Embed3 { e: Embed2 }
struct Embed4 { e: Embed3 }

contract DeepEmbedding {
    e4: Embed4;

    init() {
        self.e4 = Embed4{
            e: Embed3{
                e: Embed2{
                    e: Embed1{ x: 123 }
                }
            }
        };
    }
}