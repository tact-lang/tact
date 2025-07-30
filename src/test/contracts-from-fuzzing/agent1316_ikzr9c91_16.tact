contract SingleHugeString {
    big: String;

    init() {
        self.big = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    }
}