struct Coord { x: Int; y: Int; }

contract ParamStruct(
    pt: Coord,
) {
    receive() {
        let _ = self.pt.x + self.pt.y;
    }
}