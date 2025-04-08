struct BoolOnly {
    x: Bool;
    y: Bool;
    z: Bool;
}
contract TestContract {
    flags: BoolOnly;
    init() {
        self.flags = BoolOnly{ x:true, y:false, z:true };
    }
}