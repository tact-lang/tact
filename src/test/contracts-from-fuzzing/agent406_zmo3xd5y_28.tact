contract BoolOps {
    flag1: Bool = true;
    flag2: Bool = false;

    init() {
        let _ = self.flag1 && self.flag2;
    }
}