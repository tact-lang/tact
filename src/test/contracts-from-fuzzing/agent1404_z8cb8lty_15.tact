contract OptionalUninit {
    flag: Bool?;

    receive() {
        if (self.flag != null) {
            self.flag = !(self.flag!!);
        } else {
            self.flag = true;
        }
    }
}
