contract LongStringField {
    txt: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+-=[]{}|;:',.<>?/~`";

    init() {
        self.txt = self.txt;
    }
}