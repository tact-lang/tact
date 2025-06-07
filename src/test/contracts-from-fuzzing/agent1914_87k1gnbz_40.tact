struct ChainA { next: ChainB?; v: Int; }
struct ChainB { next: ChainC?; v: Int; }
struct ChainC { next: ChainD?; v: Int; }
struct ChainD { next: ChainE?; v: Int; }
struct ChainE { v: Int; }

contract TestContract {
    c: ChainA;

    init() {
        self.c = ChainA{
            v:1, next: ChainB{
                v:2, next: ChainC{
                    v:3, next: ChainD{
                        v:4, next: ChainE{
                            v:5
                        }
                    }
                }
            }
        };
    }
}