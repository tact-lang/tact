struct SMeta {
   x: Int?;
   y: String?;
   z: Bool?;
}

contract Test43 {
    meta: SMeta;

    init() {
        self.meta = SMeta{ x:null, y:"m", z:true };
    }
}