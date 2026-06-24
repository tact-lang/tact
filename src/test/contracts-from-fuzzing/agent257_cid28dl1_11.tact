struct Coord { x: Int; y: Int; }

struct Container { inner: Coord; }

contract OptParams(
    num: Int?,
    pos: Coord?,
    container: Container,
) {
    receive() {
        if (self.pos != null) {
            let _ = self.pos!!.x + self.pos!!.y;
        }
        let _ = self.container.inner.x;
    }
}