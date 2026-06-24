contract MultiOption {
    x: Int?;
    y: String?;
    z: Bool?;

    init() {
        self.x=null; self.y=null; self.z=null;
    }

    receive() {
        let a=self.x; let b=self.y; let c=self.z;
    }
}