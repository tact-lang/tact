struct ChainOptInt {
    x: Int?;
}

struct ChainOptMid {
    inner: ChainOptInt?;
}

contract ChainOptTest {
    saved: ChainOptMid;

    init() {
        self.saved = ChainOptMid{
            inner: ChainOptInt{ x: null }
        };
    }
}