contract ParamStorage(
    x: Int,
    y: Int as uint32,
    z: Bool,
    t: String?,
    s: Bool? 
) {
    receive() {
        let _ = self.x + 1 + self.y;
    }
}