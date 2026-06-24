contract TestContract(
    x: Int,
    y: Int?,
    z: String?,
    w: Bool?,
) {
    receive() {
        dump(self.x);
        dump(self.y);
        dump(self.z);
        dump(self.w);
    }
}