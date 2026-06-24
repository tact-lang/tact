contract BoolEdgeCaseFields {
    flag1: Bool = false;
    flag2: Bool = true;
    optFlag: Bool?;

    receive() {
        let _ = self.flag2;
    }
}