struct Embed1 { x: Int }
struct Embed2 { y: Embed1 }
struct Embed3 { z: Embed2 }

contract EmbedStructLevel3 {
    data: Embed3;

    init() {
        self.data = Embed3{
            z: Embed2{
                y: Embed1{x: 55}
            }
        };
    }
}