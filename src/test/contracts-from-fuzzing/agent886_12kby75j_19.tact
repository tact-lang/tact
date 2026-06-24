struct TextHolder {
    s: String;
}

contract TestContract {
    t: TextHolder;

    init() {
        self.t = TextHolder{
            s: "This is a very long sample string with lots of characters 0123456789 abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*() repeated repeated repeated repeated repeated repeated repeated repeated repeated repeated"
        };
    }
}