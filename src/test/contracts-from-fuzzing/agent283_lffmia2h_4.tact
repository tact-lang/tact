struct ChainA { next: ChainB }
struct ChainB { next: ChainC }
struct ChainC { x: Int; y: ChainD }
struct ChainD { flag: Bool; info: ChainE }
struct ChainE { note: String; optional: ChainF? }
struct ChainF { message: String; stop: Bool }

contract ChainTest {
    head: ChainA;

    init() {
        self.head = ChainA{
            next: ChainB{
                next: ChainC{
                    x: 10,
                    y: ChainD{
                        flag: false,
                        info: ChainE{
                            note: "End",
                            optional: null
                        }
                    }
                }
            }
        };
    }
}