struct DLevel4 {
    z: Int;
}
struct DLevel3 {
    d4: DLevel4;
}
struct DLevel2 {
    d3: DLevel3;
}
struct DLevel1 {
    d2: DLevel2;
}

contract Test24 {
    maybeDeep: DLevel1?;
    init() {
        self.maybeDeep = null;
    }
}