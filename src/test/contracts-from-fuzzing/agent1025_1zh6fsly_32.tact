struct One { i: Int; }
struct Two { o: One; }
struct Three { t: Two; }
struct Four { h: Three; }
struct Five { f: Four; }

contract FiveNest {
    data: Five;

    init() {
        self.data = Five{
            f: Four{
                h: Three{
                    t: Two{
                        o: One{ i: 77 }
                    }
                }
            }
        };
    }
}
