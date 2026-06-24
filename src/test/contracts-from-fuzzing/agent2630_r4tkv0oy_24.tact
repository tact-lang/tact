struct InnerMost { val: Int }

struct MidLevel { nested: InnerMost }

struct OuterTop {
    level: MidLevel
}

contract CrossLayer {
    payload: OuterTop;

    init() {
        self.payload = OuterTop{
            level: MidLevel{ nested: InnerMost{ val: 555 } }
        };
    }
}