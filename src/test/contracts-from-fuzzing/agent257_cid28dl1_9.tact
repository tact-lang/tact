struct Coord { x: Int; y: Int; }

contract OptionalStructParam(
    pos: Coord?,
) {
    receive() {
        if (self.pos != null) {
            let _ = self.pos!!.x + self.pos!!.y;
        }
    }
}