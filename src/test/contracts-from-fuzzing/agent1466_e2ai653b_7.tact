struct InnerMost { value: Int; }
struct InnerOuter { inner: InnerMost; extra: Int; }
struct OuterMost { outer: InnerOuter; flag: Bool; }

contract ChainTest {
    state: OuterMost = OuterMost{ outer: InnerOuter{ inner: InnerMost{ value: 5 }, extra: 6 }, flag: true };

    init() {
        self.state = OuterMost{ outer: InnerOuter{ inner: InnerMost{ value: 50 }, extra: 60 }, flag: false };
    }
}
