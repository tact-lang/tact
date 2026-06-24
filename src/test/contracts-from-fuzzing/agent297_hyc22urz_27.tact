struct TextData {
    s1: String;
    s2: String?;
}

contract TestContract {
    data: TextData;

    init() {
        self.data = TextData{
            s1: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789", 
            s2: null
        };
    }
}