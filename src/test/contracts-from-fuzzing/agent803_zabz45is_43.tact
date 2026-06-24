struct DeepOpt {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract ManyNulls {
    deep: DeepOpt;
    init() {
        self.deep = DeepOpt{ x:null, y:null, z:null };
    }
}