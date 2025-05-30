contract InitialOnlyOptional {
    opt: Int?;

    init() {
        self.opt = null;
    }
}