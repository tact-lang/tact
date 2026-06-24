// Contract with a struct nested containing multiple optionals inside
struct Sub {
    x: Int?;
    y: String?;
    z: Bool?;
}

contract NestedOptionalsSet {
    s: Sub;
    init() {
        self.s = Sub{ x:null, y:null, z:null };
    }
}
